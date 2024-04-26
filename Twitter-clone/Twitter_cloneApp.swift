//
//  Twitter_cloneApp.swift
//  Twitter-clone
//
//  Created by Iliyas Shakhabdin on 22.04.2024.
//

import SwiftUI
import Firebase

@main
struct Twitter_cloneApp: App {
    
    @StateObject var viewModel = AuthModel()
    
    init() {
        
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ContentView() 
            }
            .environmentObject(viewModel)
        }
    }
}
