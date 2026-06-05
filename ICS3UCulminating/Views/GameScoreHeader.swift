import SwiftUI

struct GameScoreHeader: View {
    
    // MARK: - Stored properties
    let score: Int
    let highScore: Int
    
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
                    .foregroundStyle(.secondary)
                Text("\(highScore)")
                    .font(.title)
                    .fontWeight(.black)
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
    GameScoreHeader(score: 120, highScore: 500)
        .padding()
        .background(.gray.opacity(0.1))
}
