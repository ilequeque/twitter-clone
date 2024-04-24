//
//  ProfilePhotoSelectorView.swift
//  Twitter-clone
//
//  Created by Iliyas Shakhabdin on 23.04.2024.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    @EnvironmentObject var viewModel: AuthModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack{
            HeaderSignView(topText: "Setup your account", bottomText: "Add a profile photo")
            
            Button {
                showImagePicker.toggle()
            } label: {
                if let profileImage = profileImage{
                    profileImage
                        .resizable()
                        .modifier(ProfileImageModifier())
                } else {
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .renderingMode(.template)
                        .modifier(ProfileImageModifier())
                }
            }
            .sheet(isPresented: $showImagePicker, onDismiss: loadImage ,content: {
                ImagePicker(selectedImage: $selectedImage)
            })
            .padding(.top, 44)
            
            if let selectedImage = selectedImage{
                Button{
                    viewModel.uploadProfileImage(selectedImage)
//                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(.blue)
                        .clipShape(Capsule())
                        .padding()
                }
                .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
                .padding(.top, 35)
            }

            
            Spacer()
        }
        .ignoresSafeArea()
    }
    
    func loadImage(){
        guard let selectedImage = selectedImage else {return}
        profileImage = Image(uiImage: selectedImage)
    }
}

private struct ProfileImageModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .scaledToFill()
            .frame(width: 180, height: 180)
            .clipShape(Circle())
    }
}

#Preview {
    ProfilePhotoSelectorView()
}
