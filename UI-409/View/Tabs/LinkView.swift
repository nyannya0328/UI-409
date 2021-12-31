//
//  LinkView.swift
//  UI-409
//
//  Created by nyannyan0328 on 2021/12/31.
//

import SwiftUI

struct LinkView: View {
    @State var delegeteclass = ScrollDele()
    @State var offset : CGFloat = 0
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            scrollContent()
                .padding(.top,getRect().height / 3)
                .padding(.bottom,CGFloat(links.count - 1) * 80)
                .overlay(
                
                
                
                    GeometryReader{_ in
                        
                        
                    scrollContent(showTitle: true)
                         
                            
                    }
                        .frame(height:80)
                         .offset(y: offset)
                         .background(Color("Yellow"))
                         .padding(.top,getRect().height / 3)
                        .offset(y: -offset)
                       
                
                
                    ,alignment: .top
                )
                .modifier(offsetModifer(offset: $offset))
            
            
            
                
            
        }
        .maxHW()
        .background(Color("BG"))
        .ignoresSafeArea()
        .coordinateSpace(name: "SCROLL")
        .onAppear {
            
            UIScrollView.appearance().delegate = delegeteclass
            
            UIScrollView.appearance().bounces = false
            
        }
        .onDisappear {
            
            UIScrollView.appearance().delegate = nil
            
            UIScrollView.appearance().bounces = true
            
        }
            
            
            
            
        
    }
    
    @ViewBuilder
    func scrollContent(showTitle : Bool = false)->some View{
        
        
        
        VStack(spacing:0){
            
            
            ForEach(links){link in
                
                HStack{
                    
                    
                    if showTitle{
                        
                        
                        Text(link.title)
                            .font(.title)
                            .maxWL()
                        
                        
                        
                    }
                    
                    else{
                        
                       Spacer()
                    }
                    
                    
                    
                    Image(link.logo)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 60, height: 60)
                        .foregroundColor(showTitle ? Color("BG") : Color("Yellow"))
                    
                }
                .padding(.horizontal)
                .frame(height:80)
                
                
            }
        }
       // .padding(.top,getSafeArea().top)
      //  .padding(.bottom,getSafeArea().bottom)
        
        
        
        
        
    }
}

struct LinkView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

class ScrollDele : NSObject,UIScrollViewDelegate{
    
    
    @Published var snapInterval : CGFloat = 80
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        
        let tageret = scrollView.contentOffset.y
        
        let condition = (tageret / snapInterval).rounded(.toNearestOrAwayFromZero)
        
        
        scrollView.setContentOffset(CGPoint(x: 0, y: snapInterval * condition), animated: true)
        
        
        
        
        
    }
    
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        
        let tageret = targetContentOffset.pointee.y
        
        let condition = (tageret / snapInterval).rounded(.toNearestOrAwayFromZero)
        
        
        scrollView.setContentOffset(CGPoint(x: 0, y: snapInterval * condition), animated: true)
        
        
        
        
        
        
        
    }
}

struct offsetModifer : ViewModifier{
    
    @Binding var offset : CGFloat
    
    func body(content: Content) -> some View {
        
        content
            .overlay(
            
                GeometryReader{proxy in
                    
                    
                    Color.clear
                        .preference(key: offsetKey.self, value: proxy.frame(in: .named("SCROLL")).minY)
                    
                    
                }
            
            )
            .onPreferenceChange(offsetKey.self){value in
                
                
                self.offset = value
                
            
            }
    }
}


struct offsetKey : PreferenceKey{
    
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        
        value = nextValue()
    }
}
