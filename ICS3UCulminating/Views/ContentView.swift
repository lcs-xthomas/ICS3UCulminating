import SwiftUI

struct ContentView: View {
    
    // MARK: - Stored properties
    @Environment(GameViewModel.self) var viewModel
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            Group {
                if viewModel.isGameActive {
                    GameView()
                } else {
                    MainMenuView()
                }
            }
            .navigationTitle(viewModel.isGameActive ? "Anagrams" : "Main Menu")
            .background(Color(.systemGroupedBackground))
            .toolbar {
                if viewModel.isGameActive {
                    ToolbarItem(placement: .topBarLeading) {
                        Button("Back") {
                            viewModel.goBackToMenu()
                        }
                    }
                }
            }
        }
    }
}

// MARK: - Main Menu Subview
struct MainMenuView: View {
    @Environment(GameViewModel.self) var viewModel
    
    var body: some View {
        VStack(spacing: 25) {
            Image(systemName: "abc")
                .font(.system(size: 80))
                .foregroundStyle(.blue.gradient)
                .padding(.top, 40)
            
            Text("Select a Category")
                .font(.title2)
                .fontWeight(.bold)
            
            ScrollView {
                VStack(spacing: 15) {
                    ForEach(viewModel.categories, id: \.self) { category in
                        Button(action: {
                            viewModel.selectCategory(category)
                        }) {
                            HStack {
                                Text(category)
                                    .font(.headline)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                            .padding()
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .shadow(color: .black.opacity(0.05), radius: 5, y: 2)
                        }
                        .foregroundStyle(.primary)
                    }
                }
                .padding()
            }
        }
    }
}

// MARK: - Game View Subview
struct GameView: View {
    @Environment(GameViewModel.self) var viewModel
    
    var body: some View {
        VStack(spacing: 20) {
            
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
                if let word = viewModel.currentWord {
                    Text("Category: \(word.category)")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundStyle(.blue)
                    
                    Text("Hint: \(word.hint)")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }
                
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
    }
}

#Preview {
    ContentView()
        .environment(GameViewModel())
}
