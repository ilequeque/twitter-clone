//
//  ContentView.swift
//  Twitter-clone
//
//  Created by Iliyas Shakhabdin on 22.04.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var showMenu = false
    @EnvironmentObject var viewModel: AuthModel
    
    var body: some View {
        Group{
            if viewModel.userSession == nil{
                LogInView()
            } else {
                mainInterfaceView
            }
        }
    }
}

#Preview {
    NavigationView {
        ContentView()
    }
}

extension ContentView {
    var mainInterfaceView: some View{
        ZStack(alignment: .topLeading){
            MainTabView()
                .navigationBarHidden(showMenu)
            
            if showMenu {
                ZStack{
                    Color(.black)
                        .opacity(showMenu ? 0.25 : 0.0)
                }
                .onTapGesture {
                    withAnimation {
                        showMenu = false
                    }
                }
                .ignoresSafeArea()
            }
            
            SideMenuView()
                .frame(width: 300)
                .offset(x: showMenu ? 0: -300, y: 0)
                .background(showMenu ? .white: .clear)
        }
        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItem(placement: .navigationBarLeading) {
                Button{
                    withAnimation(.easeInOut){
                        showMenu.toggle()
                    }
                } label: {
                    Circle().frame(width: 32, height: 32)
                }
            }
        }
        .onAppear{
            showMenu = false
        }
    }
}
