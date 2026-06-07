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
                        if viewModel.isCategoryFinished {
                            CategoryCompletedView()
                        } else {
                            GameView()
                        }
                    } else {
                        MainMenuView()
                    }
                }
            }
            .navigationTitle(viewModel.isGameActive ? (viewModel.isCategoryFinished ? "Success!" : "Anagrams") : "")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                if viewModel.isGameActive && !viewModel.isCategoryFinished {
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
                            .foregroundStyle(Color.orange)
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
                    .foregroundStyle(Color.white)
                    .padding()
                    .background {
                        Circle()
                            .fill(Color.orange.gradient)
                            .shadow(color: Color.orange.opacity(0.3), radius: 10, y: 5)
                    }
                
                Text("ANAGRAMS")
                    .font(.system(size: 34, weight: .black, design: .rounded))
                    .tracking(4)
                    .foregroundStyle(Color.orange.gradient)
                
                Text("Pick a category to start")
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.secondary)
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
                                    .foregroundStyle(Color.orange.gradient)
                            }
                            .padding(.vertical, 20)
                            .padding(.horizontal, 24)
                            .background {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.white)
                                    .shadow(color: Color.black.opacity(0.05), radius: 8, y: 4)
                            }
                        }
                        .foregroundStyle(Color.primary)
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
    @FocusState private var isTextFieldFocused: Bool
    
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
                        .foregroundStyle(Color.orange)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 4)
                        .background(Color.orange.opacity(0.1))
                        .clipShape(Capsule())
                }
                
                // Scrambled Word Display
                HStack(spacing: 8) {
                    ForEach(Array(viewModel.displayScrambledWord.enumerated()), id: \.offset) { _, letter in
                        LetterBubbleView(letter: letter)
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 10)
            }
            
            // Feedback Message
            Text(viewModel.feedbackMessage)
                .font(.callout)
                .fontWeight(.bold)
                .foregroundStyle(viewModel.feedbackMessage.contains("Correct") ? Color.green : Color.orange)
                .padding(.vertical, 8)
                .padding(.horizontal, 20)
                .background(viewModel.feedbackMessage.isEmpty ? Color.clear : Color(.systemBackground))
                .clipShape(Capsule())
                .shadow(color: Color.black.opacity(0.05), radius: 5)
            
            // User Input
            TextField("TYPE GUESS HERE", text: Bindable(viewModel).userGuess)
                .focused($isTextFieldFocused)
                .textFieldStyle(.plain)
                .font(.system(.title2, design: .rounded, weight: .bold))
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.white)
                        .shadow(color: Color.black.opacity(0.05), radius: 5)
                }
                .padding(.horizontal)
                .multilineTextAlignment(.center)
                .textInputAutocapitalization(.characters)
                .autocorrectionDisabled(true)
                .onSubmit {
                    viewModel.checkGuess()
                    // Maintain focus after submitting
                    isTextFieldFocused = true
                }
            
            Spacer()
            
            // Controls
            GameControlsView(viewModel: viewModel)
                .padding(.bottom)
        }
        .onAppear {
            // Auto-focus when the game view appears
            isTextFieldFocused = true
        }
    }
}

// MARK: - Category Completed Subview
struct CategoryCompletedView: View {
    @Environment(GameViewModel.self) var viewModel
    
    var body: some View {
        VStack(spacing: 30) {
            Image(systemName: "trophy.fill")
                .font(.system(size: 80))
                .foregroundStyle(Color.orange.gradient)
                .padding(.top, 40)
            
            VStack(spacing: 10) {
                Text("Category Completed!")
                    .font(.title)
                    .fontWeight(.black)
                
                Text("You've unscrambled all words in")
                    .font(.subheadline)
                    .foregroundStyle(Color.secondary)
                
                Text(viewModel.selectedCategory)
                    .font(.headline)
                    .foregroundStyle(Color.orange)
            }
            
            VStack(spacing: 5) {
                Text("FINAL SCORE")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.secondary)
                
                Text("\(viewModel.score)")
                    .font(.system(size: 60, weight: .black, design: .rounded))
                    .foregroundStyle(Color.orange.gradient)
            }
            .padding()
            .frame(width: 200)
            .background {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white)
                    .shadow(color: Color.black.opacity(0.05), radius: 10)
            }
            
            Spacer()
            
            Button(action: {
                withAnimation(.spring()) {
                    viewModel.goBackToMenu()
                }
            }) {
                Text("BACK TO MENU")
                    .font(.headline)
                    .fontWeight(.black)
                    .foregroundStyle(Color.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 18)
                    .background(Color.orange)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .padding(.horizontal)
            }
            .padding(.bottom, 40)
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .environment(GameViewModel())
}
