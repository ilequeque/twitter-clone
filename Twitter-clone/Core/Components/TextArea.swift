//
//  TextArea.swift
//  Twitter-clone
//
//  Created by Iliyas Shakhabdin on 22.04.2024.
//

import SwiftUI

struct TextArea: View {
    @Binding var text: String
    let placeholder: String
    @State private var isEditing: Bool = false
    
    init(_ placeholder: String, text: Binding<String>) {
        self.placeholder = placeholder
        self._text = text
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack(alignment: .topLeading){
            
            if text.isEmpty && !isEditing{
                Text(placeholder)
                    .foregroundColor(Color(.placeholderText))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 12)
                    .zIndex(1)
            }
            
            TextEditor(text: $text)
                .padding(4)
                .zIndex(0)
                .onTapGesture {
                    isEditing = true // Set isEditing to true when the text field is tapped
                }
        }
        .font(.body)
        .onChange(of: text) { newText, _ in
            if newText.isEmpty { // Update isEditing based on the text field's content
                isEditing = false
            }
        }
    }
}
