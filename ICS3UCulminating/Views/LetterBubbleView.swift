import SwiftUI

struct LetterBubbleView: View {
    
    // MARK: - Stored properties
    let letter: Character
    
    // MARK: - Body
    var body: some View {
        Text(String(letter).uppercased())
            .font(.title)
            .fontWeight(.bold)
            .foregroundStyle(.white)
            .frame(width: 50, height: 60)
            .background {
                RoundedRectangle(cornerRadius: 12)
                    .fill(.blue.gradient)
                    .shadow(radius: 3, y: 2)
            }
    }
}

#Preview {
    HStack {
        LetterBubbleView(letter: "S")
        LetterBubbleView(letter: "W")
        LetterBubbleView(letter: "I")
    }
    .padding()
}
