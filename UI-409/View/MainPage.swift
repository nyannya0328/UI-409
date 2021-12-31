//
//  MainPage.swift
//  UI-409
//
//  Created by nyannyan0328 on 2021/12/31.
//

import SwiftUI

struct MainPage: View {
    @State var currentTab : String = "Home"
    @State var showMenu : Bool = false
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        ZStack{
            
            SlideView(currentTab: $currentTab)
            
            
            
            CustomTabView(showMenu: $showMenu,currentTab: $currentTab)
                .cornerRadius(showMenu ? 20 : 0)
                .offset(x: showMenu ? getRect().width / 2 : 0)
                .rotation3DEffect(.init(degrees: showMenu ? -20 : 0), axis: (x: 0, y: 1, z: 0), anchor: .trailing, anchorZ: 0, perspective: 5)
               
                .ignoresSafeArea()
            
            
            
            
            
        }
       
       
    }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}
