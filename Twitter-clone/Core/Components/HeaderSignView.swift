//
//  HeaderSignView.swift
//  Twitter-clone
//
//  Created by Iliyas Shakhabdin on 22.04.2024.
//

import SwiftUI

struct HeaderSignView: View {
    let topText: String
    let bottomText: String
    var body: some View {
        VStack (alignment: .leading) {
           HStack{
               Spacer()
           }
           Text(topText).font(.largeTitle)
               .fontWeight(.semibold)
           
           Text(bottomText).font(.largeTitle)
               .fontWeight(.semibold)
       }
       .frame(height: 260)
       .padding(.leading)
       .background(.blue)
       .foregroundColor(.white)
       .clipShape(RoundedShape(corners: [.bottomRight]))
    }
}

#Preview {
    HeaderSignView(topText: "Hello", bottomText: "Welcome Back")
}
