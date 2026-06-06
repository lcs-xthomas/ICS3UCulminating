import SwiftUI

struct GameScoreHeader: View {
    
    // MARK: - Stored properties
    let score: Int
    let highScore: Int
    let isNewHighScore: Bool
    
    // MARK: - Body
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("SCORE")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundStyle(.secondary)
                Text("\(score)")
                    .font(.title)
                    .fontWeight(.black)
            }
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text("HIGH SCORE")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundStyle(isNewHighScore ? .orange : .secondary)
                
                Text("\(highScore)")
                    .font(.title)
                    .fontWeight(.black)
                    .foregroundStyle(isNewHighScore ? .orange : .primary)
                    .scaleEffect(isNewHighScore ? 1.2 : 1.0)
                    .animation(.spring(response: 0.4, dampingFraction: 0.5), value: isNewHighScore)
            }
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 16)
                .fill(.background)
                .shadow(color: .black.opacity(0.1), radius: 10)
        }
        .padding(.horizontal)
    }
}

#Preview {
    VStack {
        GameScoreHeader(score: 120, highScore: 500, isNewHighScore: false)
        GameScoreHeader(score: 550, highScore: 550, isNewHighScore: true)
    }
    .padding()
    .background(.gray.opacity(0.1))
}
