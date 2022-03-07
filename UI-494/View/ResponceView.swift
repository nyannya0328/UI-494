//
//  ResponceView.swift
//  UI-494
//
//  Created by nyannyan0328 on 2022/03/07.
//

import SwiftUI

struct ResponceView<Content : View>: View {
    
    var content : (Properties) -> Content
    var body: some View {
        GeometryReader{proxy in
            
            let size = proxy.size
            let isLandScape = (size.width > size.height)
            
            let isIpad = UIDevice.current.userInterfaceIdiom == .pad
            
            content(Properties(isLandScape: isLandScape, isSplit: isSplit(), isIpad: isIpad, size: size))
                .frame(width: size.width, height: size.height)
                .onAppear {
                    
                    
                    updateFraction(fraction: isLandScape && !isSplit() ? 0.3 : 0.5)
                }
                .onChange(of: isSplit(), perform: { newValue in
                    
                    
                    
                    
                    updateFraction(fraction: isLandScape && !isSplit() ? 0.3 : 0.5)
                 
                    
                    
                    
                })
                .onChange(of: isLandScape) { newValue in
                    
                    
                    updateFraction(fraction: newValue && !isSplit() ? 0.3 : 0.5)
                }
            
        }
    }
    
    func isSplit()->Bool{
        
        
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else{
            
            return false
        }
        
        return screen.windows.first?.frame.size != UIScreen.main.bounds.size
        
        
    }
    
    func updateFraction(fraction : Double){
        
        
        NotificationCenter.default.post(name: NSNotification.Name("UPDATEFRACITON"), object: nil,userInfo: [
        
        
            "fraction" : fraction
        
        ])
    }
}

struct Properties{
    
    var isLandScape : Bool
    var isSplit : Bool
    var isIpad : Bool
    var size : CGSize
}
