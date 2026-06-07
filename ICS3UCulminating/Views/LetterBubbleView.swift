import SwiftUI

struct LetterBubbleView: View {
    
    // MARK: - Stored properties
    let letter: Character
    
    // MARK: - Body
    var body: some View {
        Text(String(letter).uppercased())
            .font(.title)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
            .minimumScaleFactor(0.5)
            .lineLimit(1)
            .frame(maxWidth: 50)
            .frame(height: 60)
            .frame(maxWidth: .infinity)
            .background {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.blue.gradient)
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
