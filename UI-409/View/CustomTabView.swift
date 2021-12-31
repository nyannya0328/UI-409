//
//  CustomTabView.swift
//  UI-409
//
//  Created by nyannyan0328 on 2021/12/31.
//

import SwiftUI

struct CustomTabView: View {
    @Binding var showMenu : Bool
    @Binding var currentTab : String
    var body: some View {
        VStack{
            
            
            HStack{
                
                Button {
                    
                    withAnimation{
                        
                        showMenu = true
                    }
                    
                } label: {
                    
                    Image(systemName: "line.3.horizontal")
                        .font(.title)
                        .foregroundColor(.white)
                }
                .opacity(showMenu ? 0 : 1)

                
                Spacer()
                
                Image("p1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                
                
                
                
                
                
                
            }
            .padding(.horizontal)
            .padding(.bottom,8)
            .padding(.top,getSafeArea().top)
            
            
            TabView(selection: $currentTab) {
                
            LinkView()
                    .tag("Home")
                
                
               PicsumView()
                    .tag("Discover")
                
               BoxView()
                    .tag("Devices")
                
                LinkView()
                    .maxHW().ignoresSafeArea()
                    .tag("Profile")
                
                
                Text("Settings")
                    .tag("Settings")
                    
                
                
                
            }
            
            
        }
        .maxHW()
        .background(Color("BG"))
        .overlay(
        
        
            Button(action: {
                withAnimation{
                    
                    showMenu = false
                }
            }, label: {
                
                Image(systemName: "xmark")
                    .font(.title2)
                    .foregroundColor(.white)
                
                
            })
                .opacity(showMenu ? 1 : 0)
                .padding(.top)
                
        
            ,alignment: .topLeading
        )
    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
