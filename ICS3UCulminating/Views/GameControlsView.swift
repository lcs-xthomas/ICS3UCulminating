import SwiftUI

struct GameControlsView: View {
    
    // MARK: - Stored properties
    var viewModel: GameViewModel
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 15) {
            Button(action: {
                viewModel.checkGuess()
            }) {
                Text("Submit")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(viewModel.userGuess.isEmpty ? .gray : .blue)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            .disabled(viewModel.userGuess.isEmpty)
            
            HStack(spacing: 15) {
                Button(action: {
                    viewModel.shuffleAgain()
                }) {
                    Label("Shuffle", systemImage: "shuffle")
                        .font(.subheadline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.orange.opacity(0.1))
                        .foregroundStyle(.orange)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                
                Button(action: {
                    viewModel.skipWord()
                }) {
                    Label("Skip", systemImage: "arrow.right.circle")
                        .font(.subheadline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.secondary.opacity(0.1))
                        .foregroundStyle(.secondary)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
            }
            
            Button(action: {
                viewModel.restartGame()
            }) {
                Text("Restart Game")
                    .font(.caption)
                    .foregroundStyle(.red)
                    .padding(.top, 5)
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    GameControlsView(viewModel: GameViewModel())
}
