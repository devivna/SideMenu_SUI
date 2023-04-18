//
//  BaseView.swift
//  SideMenu
//
//  Created by Надія on 14.12.2022.
//

import SwiftUI

struct BaseView: View {
    
    @State var showMenu = false
    
    init() {
        UITabBar.appearance().isHidden = false
    }
    
    @State var selectedTab = "Home"
    
    // Offset for Both Drag Gesture and showing Menu
    @State var offset: CGFloat = 0
    @State var lastStoredOffset: CGFloat = 0
    
    //Gesture Offset
    @GestureState var gestureOffset: CGFloat = 0
    
    var body: some View {
        
        let sideBarWidth = getRect().width - 90
        
        NavigationView {
            HStack(spacing: 0) {
                
                SideMenu(showMenu: $showMenu)
                
                VStack(spacing: 0) {
                    TabView(selection: $selectedTab) {
                        HomeView(showMenu: $showMenu)
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarBackButtonHidden(true)
                            .tag("Home")
                        
                        Text("Search")
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarBackButtonHidden(true)
                            .tag("Search")
                        
                        Text("Notifications")
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarBackButtonHidden(true)
                            .tag("Notifications")
                        
                        Text("Library")
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarBackButtonHidden(true)
                            .tag("Library")
                    }
                        
                        HStack(spacing: 0) {
                            TabButton(image: "house")
                            TabButton(image: "magnifyingglass")
                            TabButton(image: "rectangle.grid.2x2")
                            TabButton(image: "ellipsis.rectangle.fill")
                        }
                   }
                    .frame(width: getRect().width)
                    .overlay(
                    Rectangle()
                        .fill(
                            Color.primary
                                .opacity(Double((offset / sideBarWidth) / 5))
                             )
                        .ignoresSafeArea(.container, edges: .vertical)
                        .onTapGesture {
                            withAnimation {
                                showMenu.toggle()
                            }
                        }
                    )
                
            }
            .frame(width: getRect().width + sideBarWidth)
            .offset(x: -sideBarWidth / 2 )
            .offset(x: offset > 0 ? offset : 0)
            
            .gesture(
            DragGesture()
                .updating($gestureOffset, body: { value, out, _ in
                    out = value.translation.width
                })
                .onEnded(onEnd(value:))
            
            )
            
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
        }
        .animation(.easeOut, value: offset == 0)
        .onChange(of: showMenu) { newValue in
            if showMenu && offset == 0 {
                offset = sideBarWidth
                lastStoredOffset = offset
            }
            if !showMenu && offset == sideBarWidth {
                offset = 0
                lastStoredOffset = 0
            }
        }
        .onChange(of: gestureOffset) { newValue in
            onChange()
        }
    }
    
    func onChange() {
        let sideBarWidth = getRect().width - 90
        offset = (gestureOffset != 0) ? (gestureOffset + lastStoredOffset < sideBarWidth ? gestureOffset + lastStoredOffset : offset) : offset
    }
    
    func onEnd(value: DragGesture.Value) {
        let sideBarWidth = getRect().width - 90
        
        let translation = value.translation.width
        
        withAnimation {
            if translation > 0 {
                if translation > (sideBarWidth / 2) {
                    // showing menu
                    offset = sideBarWidth
                    showMenu = true
                } else {
                    
                    if offset == sideBarWidth {
                        return
                    }
                    
                    offset = 0
                    showMenu = false
                }
            } else {
                if -translation > (sideBarWidth / 2) {
                    offset = 0
                    showMenu = false
                } else {
                    
                    if offset == 0 || !showMenu {
                        return
                    }
                    
                    offset = sideBarWidth
                    showMenu = true
                }
            }
        }
        
        lastStoredOffset = offset
    }
    
    
    @ViewBuilder
    func TabButton(image: String) -> some View {
        Button {
            withAnimation{selectedTab = image}
        } label: {
            Image(systemName: image)
                .resizable()
                .renderingMode(.template)
                .scaledToFit()
                .frame(width: 23, height: 22)
                .foregroundColor(selectedTab == image ? .primary : .gray)
                .frame(maxWidth: .infinity)
        }

    }
}

struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView()
    }
}
