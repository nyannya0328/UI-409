//
//  BoxView.swift
//  UI-409
//
//  Created by nyannyan0328 on 2021/12/31.
//

import SwiftUI

struct BoxView: View {
    @State var count : Int = 100
    
    let columns = Array(repeating: GridItem(.flexible(),spacing: 10), count: 3)
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack{
                    
                    LazyVGrid(columns:columns,spacing: 10){
                        
                        ForEach(1...count,id:\.self){count in
                            
                            
                            Color.red
                                .frame(height: 50)
                                .cornerRadius(10)
                                .overlay(
                                
                                Text("\(count)")
                                    .font(.largeTitle.bold())
                                    .foregroundColor(.green)
                                    
                                    
                                
                                )
                        }
                    }
                    .padding()
                    .shadow(color: .black.opacity(0.5), radius: 5, x: 5, y: 5)
                    .shadow(color: .orange.opacity(0.5), radius: 5, x: 5, y: 5)
                }
            }
            .navigationTitle("Box View")
        }
    }
}

struct BoxView_Previews: PreviewProvider {
    static var previews: some View {
        BoxView()
    }
}
