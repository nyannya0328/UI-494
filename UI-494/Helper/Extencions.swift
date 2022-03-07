//
//  Extencions.swift
//  UI-494
//
//  Created by nyannyan0328 on 2022/03/07.
//

import SwiftUI


extension UISplitViewController{
    
    open override func viewDidLoad() {
        
        self.preferredDisplayMode = .twoOverSecondary
        self.preferredSplitBehavior = .displace
        self.preferredPrimaryColumnWidthFraction = 0.3
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateView(notif:)), name: NSNotification.Name("UPDATEFRACITON"), object: nil)
    }
    
    @objc
    func updateView(notif : Notification){
        
        
        if let info = notif.userInfo,let fraction = info["fraction"] as? Double{
            
            
            self.preferredPrimaryColumnWidthFraction = fraction
            
            
        }
        
        
        
    }
    
    
}

extension View{
    
    func getRect()->CGRect{
        
        
        return UIScreen.main.bounds
    }
    
    func lLeading()->some View{
        
        self
            .frame(maxWidth:.infinity,alignment: .leading)
    }
    func lTreading()->some View{
        
        self
            .frame(maxWidth:.infinity,alignment: .trailing)
    }
    func lCenter()->some View{
        
        self
            .frame(maxWidth:.infinity,alignment: .center)
    }
    
    func maxHW()->some View{
        
        self
            .frame(maxWidth:.infinity,maxHeight: .infinity)
        
    
    }
    
    func maxTop() -> some View{
        
        
        self
            .frame(maxWidth:.infinity,maxHeight: .infinity,alignment: .top)
            
    }
}
