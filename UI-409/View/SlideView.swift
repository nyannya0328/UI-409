//
//  SlideView.swift
//  UI-409
//
//  Created by nyannyan0328 on 2021/12/31.
//

import SwiftUI

struct SlideView: View {
    @Binding var currentTab : String
    @Namespace var animation
    var body: some View {
        VStack{
            
            HStack(spacing:10){
                
                Image("p1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                
                Text("Profile")
                    .font(.title2)
                    .foregroundColor(.white)
                
                
            }
            .maxWL()
            
            
            ScrollView(getRect().height < 750 ? .vertical : .init(), showsIndicators: false) {
                
                VStack(spacing:10){
                    
                    
                    TabCardView(icon: "theatermasks.fill", title: "Home")
                    
                    TabCardView(icon: "safari.fill", title: "Discover")
                    
                    TabCardView(icon: "applewatch", title: "Devices")
                    
                    TabCardView(icon: "person.fill", title: "Profile")
                    
                    TabCardView(icon: "gearshape.fill", title: "Settings")
                    
                    TabCardView(icon: "info.circle.fill", title: "About")
                    
                    TabCardView(icon: "questionmark.circle.fill", title: "Help")
                    
                    
                    Spacer()
                    
                    
                    TabCardView(icon: "rectangle.portrait.and.arrow.right", title: "Log Out")
                    
                    
                    
                    
                }
                .padding()
                .padding(.top,45)
                
                
            }
            .frame(width: getRect().width / 2)
            .maxWL()
            
            
            
        }
        .padding(.leading,10)
        .frame(maxWidth:.infinity,maxHeight: .infinity,alignment: .top)
        .background(Color("BG"))
       
    }
    
    @ViewBuilder
    func TabCardView(icon : String,title : String)->some View{
        
        
        Button {
            
            if currentTab == "Log Out"{}
            
            else{
                
                
                withAnimation{
                    
                    currentTab = title
                }
                
            }
            
           
        } label: {
            
            HStack(spacing:10){
                
                
                Image(systemName: icon)
                    .font(.title3)
                    .frame(width: currentTab == title ? 50 : nil, height: 50)
                    .foregroundColor(currentTab == title ? Color("Purple") : (title == "Log Out" ? Color("Orange") : .white))
                   
                    .background(
                    
                        ZStack{
                            
                            if currentTab == title{
                                
                                Color.white
                                    .clipShape(Circle())
                                    .matchedGeometryEffect(id: "TABTITLE", in: animation)
                                
                                
                            }
                        }
                    
                    
                    )
                
                
                
                Text(title)
                    .font(.callout.weight(.semibold))
                    .foregroundColor(title == "Log Out" ? Color("Orange") : .white)
                  
                    
            }
            .padding(.trailing,20)
            .background(
            
                ZStack{
                    
                    if currentTab == title{
                        
                        Color("Purple")
                            .clipShape(Capsule())
                            .matchedGeometryEffect(id: "TABIMAGE", in: animation)
                        
                        
                    }
                }
            
            
            )
            
            
        }
        .offset(x: currentTab == title ? 15 : 0)

        
        
        
        
        
    }
}

struct SlideView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
