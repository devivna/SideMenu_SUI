//
//  SideMenu.swift
//  SideMenu
//
//  Created by Надія on 14.12.2022.
//

import SwiftUI

struct SideMenu: View {
    
    @Binding var showMenu: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            VStack(alignment: .leading, spacing: 10) {
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 65, height: 65)
                    .clipShape(Circle())
                    .foregroundColor(.brown.opacity(0.7))
                    .fontWeight(.light)
                Text("Nadia")
                    .font(.title2.bold())
                Text("@nadia")
                    .font(.callout)
                
                HStack {
                    Button {
                        //
                    } label: {
                        HStack(spacing: 3) {
                            Text("189K ")
                                .bold()
                            Text("Folowers")
                        }
                    }
                    
                    Button {
                        //
                    } label: {
                        HStack(spacing: 3) {
                            Text("1K ")
                                .bold()
                            Text("Folowing")
                        }
                    }
                }
                .accentColor(.primary)
                
            }
            .padding(.top, 25)
            .padding(.horizontal)
            .padding(.leading)
            
            ScrollView(showsIndicators: false) {
                VStack {
                    VStack(alignment: .leading, spacing: 35) {
                        // Tab buttons
                        TabButton(title: "Home", image: "house")
                        TabButton(title: "Profile", image: "person")
                        TabButton(title: "Library", image: "books.vertical")
                        TabButton(title: "Lists", image: "contextualmenu.and.cursorarrow")
                        TabButton(title: "Bookmarks", image: "bookmark")
                        TabButton(title: "Settings", image: "gear")
                    }
                    .padding()
                    .padding(.leading)
                    .padding(.top, 25)
                }
                
                Divider()
                
                TabButton(title: "Purchases", image: "cart")
                    .padding()
                    .padding(.leading)

                Divider()
                
                VStack(alignment: .leading, spacing: 25) {
                    Button("Settings and Privacy") {
                        
                    }
                    Button("Help Center") {
                        
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.primary)
                .padding()
                .padding(.leading)
                
            }.padding(.top, 20)
            
            
            VStack(spacing: 0) {
                Divider()
                
                HStack {
                    
                    Button {
                        // вибір теми: світла чи темна
                    } label: {
                        Image(systemName: "lightbulb")
                            .resizable()
                            .renderingMode(.template)
                            .scaledToFit()
                            .frame(width: 22, height: 22)
                    }
                    
                    Spacer()
                    
                    Button {
                        // ще якась стандартна опція
                    } label: {
                        Image(systemName: "square.and.arrow.up")
                            .resizable()
                            .renderingMode(.template)
                            .scaledToFit()
                            .frame(width: 22, height: 22)
                    }
                }
                .padding([.horizontal, .top], 15)
                .foregroundColor(.primary)
            }
        }
        .padding(.vertical)
        .frame(maxWidth: .infinity, alignment: .leading)
        
        .frame(width: getRect().width - 90)
        .frame(maxHeight: .infinity)
        .background(
            Color.primary
                .opacity(0.04)
                .ignoresSafeArea(.container, edges: .vertical)
        )
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    @ViewBuilder
    func TabButton(title: String, image: String) -> some View {
        NavigationLink {
            Text("\(title) View")
                .navigationBarTitle(title)
        } label: {
            HStack(spacing: 10) {
                Image(systemName: image)
                    .resizable()
                    .renderingMode(.template)
                    .scaledToFit()
                    .frame(width: 22, height: 22)
                Text(title)
            }
            .foregroundColor(.primary)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        
    }
}

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View {
    func getRect()-> CGRect {
        return UIScreen.main.bounds
    }
}
