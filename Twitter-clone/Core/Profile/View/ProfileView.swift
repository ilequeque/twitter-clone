//
//  ProfileView.swift
//  Twitter-clone
//
//  Created by Iliyas Shakhabdin on 22.04.2024.
//

import SwiftUI

struct ProfileView: View {
    @State private var selectedFilter: TweetFilterViewModel = .tweets
    @Namespace var animation
    @Environment(\.presentationMode) var mode
    private let user: User
    
    init(user: User){
        self.user = user
    }
    
    var body: some View {
        VStack(alignment: .leading){
            headerView
            
            actionButtons
            
            userBio
            
            tweetFilterBar
            
            tweetsView
            
            Spacer()
        }
        .navigationBarHidden(true)
    }
}

//#Preview {
////    ProfileView(user: User(username: <#T##String#>, fullname: <#T##String#>, profileImageUrl: <#T##String#>, email: <#T##String#>))
//}

extension ProfileView{
    
    var headerView: some View{
        ZStack (alignment: .bottomLeading){
            Color(.blue).ignoresSafeArea()
            VStack {
                Button {
                    mode.wrappedValue.dismiss() 
                } label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20, height: 16)
                        .foregroundColor(.white)
                        .offset(x: 16, y: -4)
                }

                AsyncImage(url: URL(string:  user.profileImageUrl)){ image in
                    image.image?.resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                }
                    .frame(width: 72, height: 72)
                .offset(x: 16, y: 24)
            }
        }
        .frame(height: 96)
    }
    
    var actionButtons: some View{
        HStack(spacing: 12){
            Spacer()
            Image(systemName: "bell.badge")
                .font(.title)
                .padding(6)
                .overlay(Circle().stroke(Color.gray, lineWidth: 0.75))
            
            Button{
                
            } label: {
                Text("Edit profile")
                    .font(.subheadline).bold()
                    .frame(width: 120, height: 32)
                    .foregroundColor(.black)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 0.75))
            }

        }
        .padding(.trailing)
    }
    
    var userBio: some View{
        VStack(alignment: .leading, spacing: 4){
            HStack {
                Text(user.fullname)
                    .font(.title2).bold()
                
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(Color(.blue))
            }
            
            Text("@\(user.username)")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text("The GOAT")
                .font(.subheadline)
                .padding(.vertical)
            
            HStack(spacing: 32){
                HStack{
                    Image(systemName: "mappin.and.ellipse")
                    Text("Los-Angeles, USA")
                }
//                    Spacer()
                HStack{
                    Image(systemName: "link")
                    Text("www.twitter.com/kobe")
                }
            }
            .font(.caption)
            .foregroundColor(.gray)
            
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
            .padding(.vertical)
        }
        .padding(.horizontal)
    }
    
    var tweetFilterBar: some View{
        HStack{
            ForEach(TweetFilterViewModel.allCases, id: \.rawValue) { item in
                VStack{
                    Text(item.title)
                        .font(.subheadline)
                        .fontWeight(selectedFilter == item ? .semibold : .regular)
                        .foregroundColor(selectedFilter == item ? .black : .gray)
                    
                    if selectedFilter == item{
                        Capsule()
                            .foregroundColor(.blue)
                            .frame(height: 3)
                            .matchedGeometryEffect(id: "filter", in: animation)
                    } else {
                        Capsule()
                            .foregroundColor(.clear)
                            .frame(height: 3)
                    }
                }
                .onTapGesture {
                    withAnimation(.easeInOut){
                        self.selectedFilter = item
                    }
                }
            }
        }
        .overlay(Divider().offset(x: 0, y: 16))
    }
    
    var tweetsView: some View{
        ScrollView{
            LazyVStack{
                ForEach(0 ... 9, id: \.self){_ in
                    TweetsRowView().padding()
                }
            }
        }
    }
}

