//
//  UserRowView.swift
//  Twitter-clone
//
//  Created by Iliyas Shakhabdin on 22.04.2024.
//

import SwiftUI

struct UserRowView: View {
    var body: some View {
        HStack(spacing: 12){
            Circle()
                .frame(width: 48, height: 48)
            
            VStack(alignment: .leading, spacing: 4){
                Text("cristiano").font(.subheadline)
                    .foregroundColor(.black)
                    .bold()
                
                Text("Cristiano Ronaldo").font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}

#Preview {
    UserRowView()
}
