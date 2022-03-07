//
//  DetailView.swift
//  UI-494
//
//  Created by nyannyan0328 on 2022/03/07.
//

import SwiftUI

struct DetailView: View {
    var prop : Properties
    var user : User
    
    @Environment(\.dismiss) var dissmiss
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack{
                
                
                HStack{
                    
                    
                    Button {
                        dissmiss()
                    } label: {
                    
                        Image(systemName: "chevron.left")
                            .font(.title)
                        
                        
                    }
                    .opacity(prop.isLandScape || !prop.isSplit ? (prop.isIpad ? 0 : 1) : 1)
                    
                    
                    Spacer()
                    
                    
                    Button {
                        
                    } label: {
                        
                        Image(systemName: "trash")
                            .font(.title2.weight(.semibold))
                            .foregroundColor(.red)
                    }


                    
                    
                    
                }
                .padding(.bottom,5)
                
                Divider()
                
                
                
                HStack(spacing:15){
                    
                    
                    
                    Image(user.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 60, height: 60)
                        .clipShape(Circle())
                    
                    
                    VStack(alignment: .leading, spacing: 10) {
                        
                        HStack(spacing:13){
                            
                            
                            Text(user.name)
                                .fontWeight(.bold)
                            
                            
                            if prop.isIpad{
                                
                                
                                Text("Gamil.com")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                            
                            
                            
                        }
                        
                        
                        if !prop.isIpad{
                            Text("Gamil.com")
                                .font(.caption)
                                .foregroundColor(.gray)
                            
                            
                        }
                        
                        
                        Text(user.title)
                            .font(.caption.weight(.bold))
                        
                        
                    }
                    
                    Spacer()
                    
                    
                    Text("Now")
                        .font(.title3)
                        .foregroundColor(.gray)
                    
                    
                    
                    
                }
               
                Text("""
What is Lorem Ipsum?
Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
""")
                .multilineTextAlignment(.leading)
                .lineSpacing(10)
                .padding(.top,20)
                
                
            }
            .padding()
            
        }
        .navigationBarHidden(true)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
