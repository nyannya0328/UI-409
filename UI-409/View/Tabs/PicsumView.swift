//
//  PicsumView.swift
//  UI-409
//
//  Created by nyannyan0328 on 2021/12/31.
//

import SwiftUI

struct PicsumView: View {
    @StateObject var model = SampleModel()
    var body: some View {
        NavigationView{
            
            ScrollView(.vertical, showsIndicators: false) {
                
                LazyVGrid(columns: Array(repeating: GridItem(), count: 3), spacing: 10) {
                    
                    
                    ForEach(model.fetchedImages){image in
                        
                        
                        
                        NavigationLink {
                            
                            Text(image.author)
                                .font(.title2)
                            
                        } label: {
                            
                            
                            GeometryReader{proxy in
                                
                                let size = proxy.size
                                
                                
                                AsyncImage(url: URL(string: image.download_url)) { image in
                                    
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: size.width, height: size.height)
                                        .cornerRadius(15)
                                    
                                } placeholder: {
                                    
                                    
                                    ProgressView()
                                        .font(.title3)
                                        .foregroundColor(.red)
                                        
                                        .cornerRadius(10)
                                    
                                    
                                }

                                
                                
                            }
                            .frame(height: 250)
                            
                            
                            
                            
                            
                        }

                        
                        
                        
                    }
                    
                    
                    
                    
                    
                }
                .padding()
                
            }
            .navigationTitle("Play Ground App")
        
            
            
        }
        .task {
            
            do{
                
                
                model.fetchedImages = try await model.asyncImages()
                
                
                
                
                
            }
            catch{
                
                print(error.localizedDescription)
            }
            
        }
    }
}

struct PicsumView_Previews: PreviewProvider {
    static var previews: some View {
        PicsumView()
    }
}




class SampleModel : ObservableObject{
    
    @Published var fetchedImages : [ImageModel] = []
    
    
    
    func asyncImages()async throws -> [ImageModel]{
        
        
        guard let url = URL(string: "https://picsum.photos/v2/list")else{
            
            
            throw ImageError.failed
        }
        
        let (data,_) = try await URLSession.shared.data(from: url)
        
        let json = try JSONDecoder().decode([ImageModel].self, from: data)
        
        
        return json
        
        
        
        
        
    }
    
}





enum ImageError : Error{
    
    case failed
}

struct ImageModel : Identifiable,Codable{
    
    var id : String
    var download_url : String
    var author : String
    
    enum Coodingkeys : String,CodingKey{
        
        
        case id
        case download_url
        case author
        
    }
    
    
    
}
