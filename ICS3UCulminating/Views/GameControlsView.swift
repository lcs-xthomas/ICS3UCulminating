import SwiftUI

struct GameControlsView: View {
    
    // MARK: - Stored properties
    var viewModel: GameViewModel
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 20) {
            
            // Hint Section
            VStack {
                if viewModel.isHintRevealed {
                    if let hint = viewModel.currentWord?.hint {
                        Text(hint)
                            .font(.subheadline)
                            .italic()
                            .foregroundStyle(Color.secondary)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                            .transition(.opacity.combined(with: .move(edge: .top)))
                    }
                } else {
                    Button(action: {
                        withAnimation(.spring()) {
                            viewModel.revealHint()
                        }
                    }) {
                        Label("Reveal Hint (-5 pts)", systemImage: "lightbulb.fill")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 20)
                            .background(viewModel.score < 5 ? Color.secondary.opacity(0.1) : Color.orange.opacity(0.1))
                            .foregroundStyle(viewModel.score < 5 ? Color.secondary : Color.orange)
                            .clipShape(Capsule())
                    }
                    .disabled(viewModel.score < 5)
                }
            }
            .frame(height: 50)
            
            // Submit Button
            Button(action: {
                viewModel.checkGuess()
            }) {
                Text("SUBMIT")
                    .font(.headline)
                    .fontWeight(.black)
                    .foregroundStyle(Color.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 18)
                    .background(viewModel.userGuess.isEmpty ? Color.gray : Color.orange)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .shadow(color: viewModel.userGuess.isEmpty ? Color.clear : Color.orange.opacity(0.3), radius: 10, y: 5)
            }
            .disabled(viewModel.userGuess.isEmpty)
            
            // Secondary Controls
            HStack(spacing: 15) {
                // Shuffle Button (Always Enabled and Free)
                Button(action: {
                    withAnimation(.spring()) {
                        viewModel.shuffleAgain()
                    }
                }) {
                    VStack(spacing: 4) {
                        Image(systemName: "shuffle")
                            .font(.title3)
                        Text("Shuffle")
                            .font(.caption)
                            .fontWeight(.bold)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 12)
                    .background(Color.orange.opacity(0.1))
                    .foregroundStyle(Color.orange)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                
                // Skip Button
                Button(action: {
                    withAnimation(.spring()) {
                        viewModel.skipWord()
                    }
                }) {
                    VStack(spacing: 4) {
                        Image(systemName: "forward.fill")
                            .font(.title3)
                        Text("Skip (-10 pts)")
                            .font(.caption)
                            .fontWeight(.bold)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 12)
                    .background(viewModel.score < 10 ? Color.secondary.opacity(0.1) : Color.red.opacity(0.1))
                    .foregroundStyle(viewModel.score < 10 ? Color.secondary : Color.red)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                .disabled(viewModel.score < 10)
            }
            
            // Restart Button
            Button(action: {
                withAnimation(.spring()) {
                    viewModel.restartGame()
                }
            }) {
                Text("RESTART GAME")
                    .font(.caption)
                    .fontWeight(.black)
                    .foregroundStyle(Color.secondary)
                    .padding(.top, 5)
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    GameControlsView(viewModel: GameViewModel())
        .padding()
        .background(Color(.systemGroupedBackground))
}
