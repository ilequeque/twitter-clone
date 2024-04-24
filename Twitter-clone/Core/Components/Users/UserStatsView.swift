//
//  UserStatsView.swift
//  Twitter-clone
//
//  Created by Iliyas Shakhabdin on 22.04.2024.
//

import SwiftUI

struct UserStatsView: View {
    var body: some View {
        HStack(spacing: 32){
            HStack(spacing: 4){
                Text("2")
                    .font(.subheadline)
                    .bold()
                Text("Following")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
//                    Spacer()
            HStack(spacing: 4){
                Text("23.1M")
                    .font(.subheadline)
                    .bold()
                Text("Followers")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
    }
}

#Preview {
    UserStatsView()
}
