//
//  LetterBubbleView.swift
//  ICS3UCulminating
//

import SwiftUI

struct LetterBubbleView: View {
    
    // MARK: - Stored properties
    let character: Character
    
    // MARK: - Body
    var body: some View {
        Text(String(character))
            .font(.title)
            .fontWeight(.bold)
            .frame(width: 50, height: 50)
            .background(Color.accentColor.opacity(0.2))
            .foregroundColor(.accentColor)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.accentColor, lineWidth: 2)
            )
            .shadow(radius: 2)
    }
}

#Preview {
    LetterBubbleView(character: "S")
}
