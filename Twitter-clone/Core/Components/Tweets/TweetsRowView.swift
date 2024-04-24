//
//  TweetsRowView.swift
//  Twitter-clone
//
//  Created by Iliyas Shakhabdin on 22.04.2024.
//

import SwiftUI

struct TweetsRowView: View {
    var body: some View {
        VStack(alignment: .leading){
            HStack(alignment: .top, spacing: 12){
                //user profile image
                Circle()
                    .frame(width: 56, height: 56)
                    .foregroundColor(.blue)
                
                VStack(alignment: .leading,spacing: 4) {
                    //user info
                    HStack{
                        Text("Mark Zukerberg")
                            .font(.subheadline).bold()
                        Text("@zukini")
                            .foregroundColor(.gray)
                            .font(.caption)
                        Text("2w")
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                    
                    Text("I am billionaire")
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                }
            }
            //buttons
            HStack{
                Button {
                    //action
                } label: {
                    Image(systemName: "bubble.left")
                        .font(.subheadline)
                }
                Spacer()
                
                Button {
                    //action
                } label: {
                    Image(systemName: "arrow.2.squarepath")
                        .font(.subheadline)
                }
                Spacer()
                
                Button {
                    //action
                } label: {
                    Image(systemName: "heart")
                        .font(.subheadline)
                }
                Spacer()
                
                Button {
                    //action
                } label: {
                    Image(systemName: "bookmark")
                        .font(.subheadline)
                }
            }
            .padding()
            .foregroundColor(.gray)
            
            Divider()
        }
    }
}

#Preview {
    TweetsRowView()
}
