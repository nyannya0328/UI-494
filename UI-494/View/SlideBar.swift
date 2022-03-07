//
//  SlideBar.swift
//  UI-494
//
//  Created by nyannyan0328 on 2022/03/07.
//

import SwiftUI

struct SlideBar: View {
    var prop : Properties
    @Binding var currentItem : String
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            
            VStack(alignment: .leading, spacing: 13) {
                
                
                Image("Logo")
                
                
                
                sidebarButton(icon: "tray.and.arrow.up.fill", title: "InBox")
                    .padding(.top,40)
                sidebarButton(icon: "paperplane", title: "Sent")
                sidebarButton(icon: "doc.fill", title: "Draft")
                sidebarButton(icon: "trash", title: "Deleted")
                
            }
            .padding()
            .padding(.top,20)
            
        }
        .padding(.leading,10)
        .frame(width: (prop.isLandScape ? prop.size.width : prop.size.height) / 4 > 300 ? 300 : (prop.isLandScape ? prop.size.width : prop.size.height) / 4)
        .background{
            
            
            Color("LightWhite").ignoresSafeArea()
        }
    }
    
    @ViewBuilder
    func sidebarButton(icon:String,title : String)->some View{
        
        
        Button {
            
            withAnimation{
                
                currentItem = title
            }
        } label: {
            
            VStack{
                
                HStack{
                    
                    Image(systemName: "chevron.right")
                        .font(.body.weight(.black))
                        .foregroundColor(.blue)
                        .opacity(currentItem == title ? 1 : 0)
                    
                    Image(systemName: icon)
                        .font(.callout)
                        .foregroundColor(currentItem == title ? Color("DarkBlue") : .gray)
                    
                    
                    Text(title)
                        .foregroundColor(currentItem == title ? .black : .gray)
                        
                }
                .lLeading()
                
                Divider()
            }
            
            
        }

        
    }
}

struct SlideBar_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct PaddingModifier : ViewModifier{
    
    var prop : Properties
    @Binding var padding : CGFloat
    
    
    func body(content: Content) -> some View {
        
        content
            .overlay {
                
                GeometryReader{proxy in
                    
                     Color.clear
                        .preference(key: PaddingKey.self, value: proxy.frame(in: .global))
                        .onPreferenceChange(PaddingKey.self) { value in
                            
                            
                            self.padding = -(value.minX / 3.3)
                        }
                    
                    
                    
                }
                
            }
    }
}


struct PaddingKey : PreferenceKey{
    
    static var defaultValue: CGRect = .zero
    
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        
        value = nextValue()
    }
}
