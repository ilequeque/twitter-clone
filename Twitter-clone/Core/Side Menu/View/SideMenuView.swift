//
//  SideMenuView.swift
//  Twitter-clone
//
//  Created by Iliyas Shakhabdin on 22.04.2024.
//

import SwiftUI

struct SideMenuView: View {
    @EnvironmentObject var authViewModel: AuthModel
    var body: some View {
        VStack(alignment: .leading, spacing: 42){
            VStack(alignment: .leading){
                Circle()
                    .frame(width: 48, height: 48)
                
                VStack (alignment: .leading, spacing: 4){
                    Text("Robert Downey Jr.")
                        .font(.headline)
                    
                    Text("@ironman")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
                UserStatsView()
                    .padding(.vertical)
            }
            .padding(.leading)
            
            ForEach(SideMenuViewModel.allCases, id: \.rawValue) { viewModel in
                if viewModel == .profile{
                    NavigationLink{
                        ProfileView()
                    } label: {
                        SideMenuOptionRowView(viewModel: viewModel )
                    }
                } else if viewModel == .logout {
                    Button {
                        authViewModel.signOut()
                    } label: {
                        SideMenuOptionRowView(viewModel: .logout)
                    }

                } else {
                    SideMenuOptionRowView(viewModel: viewModel)
                }
                
            }
            
            Spacer()
        }
    }
}

#Preview {
    SideMenuView()
}
