//
//  Home.swift
//  UI-494
//
//  Created by nyannyan0328 on 2022/03/07.
//

import SwiftUI

struct Home: View {
    
    @State var currentItem : String = "InBox"
    @State var showMenu : Bool = false
    
    @State var exesPadding : CGFloat = 0
    
    @State var navigationTag : String?
    var body: some View {
        ResponceView { prop in
            
            
            HStack(spacing:0){
                
                
                if prop.isLandScape && !prop.isSplit{
                    
                    SlideBar(prop: prop, currentItem: $currentItem)
                        .padding(.leading,prop.isIpad && prop.isLandScape ? exesPadding : 0)
                    
                }
                NavigationView{
                    
                    MainView(prop: prop)
                        .navigationBarHidden(true)
                        .padding(.leading,exesPadding)
                    
                }
                .modifier(PaddingModifier(prop: prop, padding: $exesPadding))
                
                
            }
            .maxHW()
            .overlay {
                
                ZStack(alignment: .leading) {
                    
                    
                    if !prop.isLandScape || prop.isSplit{
                        
                        
                        Color.black.opacity(showMenu ? 0.25 : 0).ignoresSafeArea()
                        
                            .onTapGesture {
                                
                                withAnimation{
                                    
                                    showMenu.toggle()
                                }
                            }
                        
                        SlideBar(prop: prop, currentItem: $currentItem)
                            .offset(x: showMenu ? 0 : -300)
                        
                    
                        
                    }
                    
                    
                    
                    
                }
            }
        }
        .ignoresSafeArea(.container, edges: .leading)
    }
    
    @ViewBuilder
    func MainView(prop:Properties)->some View{
        
        VStack(spacing:0){
            
            HStack{
                if !prop.isLandScape{
                    
                    Button {
                        withAnimation{
                            
                            showMenu.toggle()
                        }
                    } label: {
                        
                        
                        Image(systemName: "line.3.horizontal")
                            .font(.title3)
                            .foregroundColor(.black)
                    }

                    
                }
                
                
                TextField("Search", text: .constant(""))
                
                Image(systemName: "magnifyingglass")
                
            }
            .padding(.vertical,10)
            .padding(.horizontal)
            .background(
                RoundedRectangle(cornerRadius: 5, style: .continuous)
                    .fill(.white)
            
            )
            
            
            ScrollView(.vertical, showsIndicators: false) {
                
                
                VStack(spacing:20){
                    
                    
                    ForEach(users){user in
                        
                        NavigationLink(tag:user.id,selection: $navigationTag) {
                            
                            DetailView(prop: prop, user: user)
                            
                        } label: {
                            
                            
                            userCardView(prop: prop, user: user)
                        }

                    }
                    
                }
                .padding(.top,30)
                
                
            }
            
        }
        .padding()
        .background(Color("BG"))
        .onAppear {
            navigationTag = nil
        }
        
        
        
    }
    
    @ViewBuilder
    func userCardView(prop : Properties,user : User) -> some View{
        
        
        VStack(alignment: .leading, spacing: 15) {
            
            
            HStack(spacing:20){
                
                
                Image(user.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                
                
                VStack(alignment: .leading, spacing: 13) {
                    
                    
                    Text(user.name)
                        .font(.title3.weight(.bold))
                    
                    
                    Text(user.title)
                        .font(.caption2)
                        .foregroundColor(.gray)
                    
                    
                    
                }
                .foregroundColor(navigationTag == user.id && prop.isIpad ? .white : .black)
                .lLeading()
                
                
                Text("Now")
                    .font(.callout.weight(.semibold))
                    .foregroundColor(navigationTag == user.id && prop.isIpad ? .white : .black)
               
                
                
                
            }
            
            Text("Jaob Degrom,Gerrit Cole.Aroldis Chapman.Yu DarVish.Roki Sasaki")
                .multilineTextAlignment(.leading)
                .foregroundColor(navigationTag == user.id && prop.isIpad ? .gray : .black)
                .lineLimit(3)
            
            
        }
        .padding()
        .background(
        
        
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .fill(navigationTag == user.id ? Color("DarkBlue") : Color("LightWhite"))
        
        )
        
        
        
        
    }
    
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
