//
//  ContentView.swift
//  SideMenu
//
//  Created by Надія on 14.12.2022.
//

import SwiftUI

struct MenuItem2: Identifiable {
    var id = UUID()
    let text: String
    let imageName: String
    
    let handler: () -> Void = {
        print("Tapped item")
    }
}

struct MenuContent2: View {
    
    let items: [MenuItem2] = [
        MenuItem2(text: "Menu", imageName: "filemenu.and.selection"),
        MenuItem2(text: "Profile", imageName: "person"),
        MenuItem2(text: "Library", imageName: "books.vertical"),
        MenuItem2(text: "Settings", imageName: "gear")
    ]
    
    var body: some View {
        ZStack {
            Color.brown.opacity(0.8)
            VStack(alignment: .leading, spacing: 0) {
                Spacer()
                ForEach(items) { item in
                    HStack(spacing: 20) {
                        Image(systemName: item.imageName)
                            .resizable()
                            .frame(width: 30, height: 30)
                        Text(item.text)
                            .multilineTextAlignment(.leading)
                        
                    }
                    .font(.title)
                    .foregroundColor(.primary)
                    .padding()
                }
                Spacer()
            }
        }
    }
}

struct SideMenu2: View {
    
    let width: CGFloat
    let isMenuOpen: Bool
    let toggleMenu: () -> Void
    
    var body: some View {
        ZStack {
            // Dimmed background view
            GeometryReader { _ in
                EmptyView()
            }
            .background(Color.gray.opacity(0.15))
            .opacity(isMenuOpen ? 1 : 0)
            .animation(.easeIn.delay(0.25), value: 1)
            .onTapGesture {
                toggleMenu()
            }
            
            // MenuContent
            HStack {
                MenuContent2()
                    .frame(width: width)
                    .offset(x: isMenuOpen ? 0 : -width)
                    .animation(.default, value: 2)
                
                Spacer()
            }
        }
    }
}

struct ContentView2: View {
    
    @State var isMenuOpen = false
    
    var body: some View {

        
        
                ZStack {
            if !isMenuOpen {
                Button {
                    isMenuOpen.toggle()
                } label: {
                    Text("Open Menu")
                        .bold()
                        .frame(width: 200, height: 50)
                        .foregroundColor(.white)
                        .background(Color(.systemBlue))
                }
            }

            SideMenu2(width: UIScreen.main.bounds.width / 1.6,
                     isMenuOpen: isMenuOpen,
                     toggleMenu: toggleMenu)
        }
        .ignoresSafeArea()
    }

    func toggleMenu() {
        isMenuOpen.toggle()
    }
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}
