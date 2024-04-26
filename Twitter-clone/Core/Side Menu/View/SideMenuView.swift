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
        if let user = authViewModel.currentUser{
            VStack(alignment: .leading, spacing: 42){
                VStack(alignment: .leading){
                    AsyncImage(url: URL(string:  user.profileImageUrl)){ image in
                        image.image?.resizable()
                            .scaledToFill()
                            .clipShape(Circle()) 
                    }
                        .frame(width: 48, height: 48)
                    
                    VStack (alignment: .leading, spacing: 4){
                        Text(user.fullname)
                            .font(.headline)
                        
                        Text("@\(user.username)")
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
                            ProfileView(user: user)
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
}

#Preview {
    SideMenuView()
}
