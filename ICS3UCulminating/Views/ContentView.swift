import SwiftUI

struct ContentView: View {
    
    // MARK: - Stored properties
    @Environment(GameViewModel.self) var viewModel
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                
                // Score Header
                GameScoreHeader(
                    score: viewModel.score,
                    highScore: viewModel.highScore,
                    isNewHighScore: viewModel.isNewHighScore
                )
                .padding(.top)
                
                Spacer()
                
                // Scrambled Word Display
                VStack(spacing: 15) {
                    Text("Unscramble the word:")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    
                    HStack(spacing: 8) {
                        ForEach(Array(viewModel.displayScrambledWord.enumerated()), id: \.offset) { _, letter in
                            LetterBubbleView(letter: letter)
                        }
                    }
                }
                
                // Feedback Message
                Text(viewModel.feedbackMessage)
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundStyle(viewModel.feedbackMessage.contains("Correct") ? .green : .primary)
                    .animation(.default, value: viewModel.feedbackMessage)
                
                // User Input
                TextField("Type your guess here", text: Bindable(viewModel).userGuess)
                    .textFieldStyle(.roundedBorder)
                    .font(.title3)
                    .padding()
                    .multilineTextAlignment(.center)
                    .textInputAutocapitalization(.characters)
                    .onSubmit {
                        viewModel.checkGuess()
                    }
                
                Spacer()
                
                // Controls
                GameControlsView(viewModel: viewModel)
                    .padding(.bottom)
            }
            .navigationTitle("Anagrams")
            .background(Color(.systemGroupedBackground))
        }
    }
}

#Preview {
    ContentView()
        .environment(GameViewModel())
}
