import SwiftUI

struct ContentView: View {
    
    // MARK: - Stored properties
    @Environment(GameViewModel.self) var viewModel
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                
                // Category Picker
                Picker("Category", selection: Bindable(viewModel).selectedCategory) {
                    ForEach(viewModel.categories, id: \.self) { category in
                        Text(category).tag(category)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                .onChange(of: viewModel.selectedCategory) {
                    viewModel.selectCategory(viewModel.selectedCategory)
                }
                
                // Score Header
                GameScoreHeader(
                    score: viewModel.score,
                    highScore: viewModel.highScore,
                    isNewHighScore: viewModel.isNewHighScore
                )
                
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
            .navigationTitle("Anagrams")
            .background(Color(.systemGroupedBackground))
        }
    }
}

#Preview {
    ContentView()
        .environment(GameViewModel())
}
