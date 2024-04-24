//
//  RegistrationView.swift
//  Twitter-clone
//
//  Created by Iliyas Shakhabdin on 22.04.2024.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var userName = ""
    @State private var fullName = ""
    @EnvironmentObject var viewModel: AuthModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack{
            HeaderSignView(topText: "Get Started.", bottomText: "'Create your account")
            
            VStack(spacing: 40){
                CustomInputField(imageName: "envelope", placeholderText: "Email", text: $email)
                
                CustomInputField(imageName: "person", placeholderText: "Username", text: $userName)
                
                CustomInputField(imageName: "person", placeholderText: "Full name", text: $fullName)
                
                CustomInputField(imageName: "lock", placeholderText: "Password",
                                 isSecuredField: true,
                                 text: $password)
            }
            .padding(.horizontal, 32)
            .padding(.top, 44)
            
            Button{
                viewModel.register(with: email, password: password, fullname: fullName, username: userName)
            } label: {
                Text("Sign up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(.blue)
                    .clipShape(Capsule())
                    .padding()
            }
            .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
            .padding(.top, 35)
            
            Spacer()
            
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                HStack{
                    Text("Already have an account?")
                        .font(.footnote)
                    
                    Text("Sign in")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
            }
            .padding(.bottom, 32)
        }
        .fullScreenCover(isPresented: $viewModel.didAuthenticateUser) {
                    ProfilePhotoSelectorView()
                }
        .onDisappear()
        .ignoresSafeArea()
    }
}


#Preview {
    RegistrationView()
}
