//
//  HomeView.swift
//  SideMenu
//
//  Created by Надія on 14.12.2022.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var showMenu: Bool
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Button {
                        withAnimation {
                            showMenu.toggle()
                        }
                    } label: {
                        Image(systemName: "person.crop.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 35, height: 35)
                            .clipShape(Circle())
                            .foregroundColor(.brown.opacity(0.7))
                            .fontWeight(.light)
                    }
                    
                    Spacer()
                    
                    NavigationLink {
                        Text("Timeline View")
                            .navigationTitle("TimeLine")
                    } label: {
                        Image(systemName: "circle.grid.2x2")
                            .resizable()
                            //.renderingMode(.template)
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.primary)
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 10)
                
                Divider()
                
                
            }
            .overlay {
               Image(systemName: "circle.dotted")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    
            }
         
            Spacer()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
