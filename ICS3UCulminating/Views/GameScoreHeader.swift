//
//  GameScoreHeader.swift
//  ICS3UCulminating
//

import SwiftUI

struct GameScoreHeader: View {
    
    // MARK: - Stored properties
    let score: Int
    let highScore: Int
    
    // MARK: - Body
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Score")
                    .font(.caption)
                    .foregroundColor(.secondary)
                Text("\(score)")
                    .font(.title2)
                    .fontWeight(.bold)
            }
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text("High Score")
                    .font(.caption)
                    .foregroundColor(.secondary)
                Text("\(highScore)")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.orange)
            }
        }
        .padding()
        .background(Color(uiColor: .secondarySystemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

#Preview {
    GameScoreHeader(score: 120, highScore: 500)
        .padding()
}
