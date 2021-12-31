//
//  FoodView.swift
//  UI-409
//
//  Created by nyannyan0328 on 2021/12/31.
//

import SwiftUI

struct FoodView: View {
    
    @State var currentIndex : Int = 0
    @State var bgOffset : CGFloat = 0
    @State var titleColor : Color = .white
    @State var textAnimation : Bool = false
    @State var imageAnimation : Bool = false
    var body: some View {
        VStack{
            
            let small = getRect().height < 750
            
            
            Text(foods[currentIndex].itemTitle)
                .font(.largeTitle.bold())
                .maxWL()
                .frame(height:100)
                .offset(y: textAnimation ? 200 : 0)
                .clipped()
                .animation(.spring(), value: textAnimation)
                .padding(.top)
            
            
            
            HStack{
                
                
                VStack(alignment: .leading, spacing: 15) {
                    
                    Label {
                        
                        Text("1hour")
                        
                    } icon: {
                        
                        Image(systemName: "flame")
                            .frame(width:30)
                    }
                    Label {
                        
                        Text("40")
                        
                    } icon: {
                        
                        Image(systemName: "bookmark")
                            .frame(width:30)
                        
                    }
                    
                    
                    
                    Label {
                        
                        Text("Safety")
                        
                    } icon: {
                        
                        Image(systemName: "safari")
                            .frame(width:30)
                        
                    }
                    
                    
                    
                    Label {
                        
                        Text("Easy")
                        
                    } icon: {
                        
                        Image(systemName: "bolt")
                            .frame(width:30)
                        
                    }
                    
                    Label {
                        
                        Text("Health")
                        
                    } icon: {
                        
                        Image(systemName: "drop")
                            .frame(width:30)
                        
                    }
                    
                    
                    
                    
                }
                .font(.title3)
                .maxWL()
                
                
                GeometryReader{proxy in
                    
                    let size = proxy.size
                    
                    
                    Image(foods[currentIndex].itemImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Circle())
                        .background(
                            
                            
                            Circle()
                                .trim(from: 0.5, to: 1)
                                .stroke(
                                    
                                    LinearGradient(colors: [
                                        
                                        
                                        titleColor,
                                        titleColor.opacity(0.5),
                                        titleColor.opacity(0.3)
                                        
                                        
                                        
                                    ], startPoint: .top, endPoint: .bottom),lineWidth: 1
                                    
                                    
                                    
                                    
                                )
                                .padding(-15)
                                .rotationEffect(.init(degrees: -90))
                                .opacity(imageAnimation ? 0 : 1)
                            
                            
                            
                            
                        )
                        .frame(width: size.width, height: size.width * (small ? 1.5 :  1.8))
                        .maxH()
                        .rotationEffect(.init(degrees: imageAnimation ? 360 : 0))
                        .offset(x: 60)
                    
                    
                    
                }
                .frame(height:(getRect().width / 2) * (small ? 1.5 : 1.8))
                
            }
            
            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard.")
                .font(.callout)
                .foregroundColor(.gray)
                .lineSpacing(10)
                .lineLimit(3)
                .offset(y: textAnimation ? 200 : 0)
                .clipped()
                .animation(.spring(), value: textAnimation)
            
            
            
            
            
            
            
        }
        .padding()
        .foregroundColor(titleColor)
        .maxHW()
        .background(
            
            
            GeometryReader{proxy in
                
                let height = proxy.size.height
                
                
                
                LazyVStack(spacing:0){
                    
                    
                    ForEach(foods.indices,id:\.self){index in
                        
                        
                        if index % 2 == 0{
                            
                            Color("BG")
                                .frame(height:height)
                            
                            
                        }
                        else{
                            
                            
                            Color.white
                                .frame(height:height)
                            
                            
                            
                        }
                    }
                    
                    
                }
                .offset(y: bgOffset)
            }
                .ignoresSafeArea()
            
            
            
            
        )
        .gesture(
            
            
            DragGesture()
                .onEnded({ value in
                    
                    let height  = value.translation.height
                    
                    
                    
                    if height < 0 && -height > 50 && (currentIndex < (foods.count - 1)){
                        
                        
                        AnimatedSleder(moveUp: true)
                        
                        
                    }
                    
                    if height > 0 && height > 50 && currentIndex > 0{
                        
                        AnimatedSleder(moveUp: false)
                        
                        
                        
                    }
                    
                    
                    
                    
                    
                })
            
            
        )
    }
    
    func AnimatedSleder(moveUp : Bool = true){
        
        
        textAnimation = true
        
        
        withAnimation(.easeInOut(duration: 0.6)){
            
            
            bgOffset += (moveUp ? -getRect().height : getRect().height)
            
        }
        
        withAnimation(.interactiveSpring(response: 1, dampingFraction: 0.6, blendDuration: 0.8)){
            
            imageAnimation = true
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            
            textAnimation = false
            
            
            currentIndex = (moveUp ? (currentIndex + 1) : (currentIndex - 1))
            
            withAnimation(.easeInOut){
                
                
                titleColor = (titleColor == .black ? .white : .black)
            }
            
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            
            
            
            imageAnimation = false
        }
        
        
        
    }
}

struct FoodView_Previews: PreviewProvider {
    static var previews: some View {
        FoodView()
            .previewDevice("iPhone 8")
    }
}
