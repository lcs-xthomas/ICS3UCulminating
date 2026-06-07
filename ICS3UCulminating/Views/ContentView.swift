import SwiftUI

struct ContentView: View {
    
    // MARK: - Stored properties
    @Environment(GameViewModel.self) var viewModel
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            ZStack {
                // Global Background
                Color(.systemGroupedBackground)
                    .ignoresSafeArea()
                
                Group {
                    if viewModel.isGameActive {
                        GameView()
                    } else {
                        MainMenuView()
                    }
                }
            }
            .navigationTitle(viewModel.isGameActive ? "Anagrams" : "")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                if viewModel.isGameActive {
                    ToolbarItem(placement: .topBarLeading) {
                        Button(action: {
                            withAnimation(.spring()) {
                                viewModel.goBackToMenu()
                            }
                        }) {
                            HStack(spacing: 4) {
                                Image(systemName: "chevron.left")
                                Text("Menu")
                            }
                            .fontWeight(.medium)
                            .foregroundStyle(.orange)
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
        VStack(spacing: 0) {
            // Header Section
            VStack(spacing: 10) {
                Image(systemName: "text.justify.left")
                    .font(.system(size: 60))
                    .foregroundStyle(.white)
                    .padding()
                    .background {
                        Circle()
                            .fill(.orange.gradient)
                            .shadow(color: .orange.opacity(0.3), radius: 10, y: 5)
                    }
                
                Text("ANAGRAMS")
                    .font(.system(size: 34, weight: .black, design: .rounded))
                    .tracking(4)
                    .foregroundStyle(.orange.gradient)
                
                Text("Pick a category to start")
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundStyle(.secondary)
            }
            .padding(.top, 40)
            .padding(.bottom, 30)
            
            // Category List
            ScrollView(showsIndicators: false) {
                VStack(spacing: 16) {
                    ForEach(viewModel.categories, id: \.self) { category in
                        Button(action: {
                            withAnimation(.spring()) {
                                viewModel.selectCategory(category)
                            }
                        }) {
                            HStack {
                                Text(category)
                                    .font(.title3)
                                    .fontWeight(.bold)
                                
                                Spacer()
                                
                                Image(systemName: "play.circle.fill")
                                    .font(.title2)
                                    .foregroundStyle(.orange.gradient)
                            }
                            .padding(.vertical, 20)
                            .padding(.horizontal, 24)
                            .background {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(.white)
                                    .shadow(color: .black.opacity(0.05), radius: 8, y: 4)
                            }
                        }
                        .foregroundStyle(.primary)
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 30)
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
            VStack(spacing: 20) {
                VStack(spacing: 4) {
                    Text(viewModel.selectedCategory.uppercased())
                        .font(.caption)
                        .fontWeight(.black)
                        .foregroundStyle(.orange)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 4)
                        .background(.orange.opacity(0.1))
                        .clipShape(Capsule())
                }
                
                HStack(spacing: 8) {
                    ForEach(Array(viewModel.displayScrambledWord.enumerated()), id: \.offset) { _, letter in
                        LetterBubbleView(letter: letter)
                    }
                }
                .padding(.vertical, 10)
            }
            
            // Feedback Message
            Text(viewModel.feedbackMessage)
                .font(.callout)
                .fontWeight(.bold)
                .foregroundStyle(viewModel.feedbackMessage.contains("Correct") ? .green : .orange)
                .padding(.vertical, 8)
                .padding(.horizontal, 20)
                .background(viewModel.feedbackMessage.isEmpty ? .clear : Color(.systemBackground))
                .clipShape(Capsule())
                .shadow(color: .black.opacity(0.05), radius: 5)
            
            // User Input
            TextField("TYPE GUESS HERE", text: Bindable(viewModel).userGuess)
                .textFieldStyle(.plain)
                .font(.system(.title2, design: .rounded, weight: .bold))
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.white)
                        .shadow(color: .black.opacity(0.05), radius: 5)
                }
                .padding(.horizontal)
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
