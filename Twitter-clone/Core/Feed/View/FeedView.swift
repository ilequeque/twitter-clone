//
//  FeedView.swift
//  Twitter-clone
//
//  Created by Iliyas Shakhabdin on 22.04.2024.
//

import SwiftUI

struct FeedView: View {
    @State private var showNewTweetView = false
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView{
                LazyVStack{
                    ForEach(0...20, id:\.self){_ in
                        TweetsRowView() 
                    }
                }
            }
            
            Button {
                showNewTweetView.toggle()
            } label: {
                Image(systemName: "pencil.and.scribble")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 28, height: 28)
                    .padding().foregroundColor(.white)
            }
            .background(.blue)
            .clipShape(Circle())
            .padding()
            .fullScreenCover(isPresented: $showNewTweetView){
                NewTweetView()
            }
        }
    }
}

#Preview {
    FeedView()
}
