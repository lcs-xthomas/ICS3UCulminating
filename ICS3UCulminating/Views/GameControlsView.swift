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
                            .foregroundStyle(.secondary)
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
                            .background(.orange.opacity(0.1))
                            .foregroundStyle(.orange)
                            .clipShape(Capsule())
                    }
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
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 18)
                    .background(viewModel.userGuess.isEmpty ? .gray : .orange)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .shadow(color: viewModel.userGuess.isEmpty ? .clear : .orange.opacity(0.3), radius: 10, y: 5)
            }
            .disabled(viewModel.userGuess.isEmpty)
            
            // Secondary Controls
            HStack(spacing: 15) {
                // Shuffle Button
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
                    .background(.orange.opacity(0.1))
                    .foregroundStyle(.orange)
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
                    .background(.red.opacity(0.1))
                    .foregroundStyle(.red)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                }
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
                    .foregroundStyle(.secondary)
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
