import Foundation
import Observation

@Observable
class GameViewModel {
    
    // MARK: - Stored properties
    var allWords: [WordModel] = []
    var filteredWords: [WordModel] = []
    var currentWordIndex: Int = 0
    var userGuess: String = ""
    var score: Int = 0
    var highScore: Int = 0
    var feedbackMessage: String = ""
    var displayScrambledWord: String = ""
    var isNewHighScore: Bool = false
    var selectedCategory: String = "All"
    var isGameActive: Bool = false
    var isHintRevealed: Bool = false
    var isCategoryFinished: Bool = false
    
    // MARK: - Computed properties
    var categories: [String] {
        var uniqueCategories = Set<String>()
        uniqueCategories.insert("All")
        for word in allWords {
            uniqueCategories.insert(word.category)
        }
        return Array(uniqueCategories).sorted()
    }
    
    var currentWord: WordModel? {
        if filteredWords.isEmpty {
            return nil
        }
        if currentWordIndex < filteredWords.count {
            return filteredWords[currentWordIndex]
        }
        return nil
    }
    
    // MARK: - Initializer
    init() {
        self.allWords = WordModel.sampleWords
        self.highScore = JSONStorageService.loadHighScore()
        self.filterWords()
    }
    
    // MARK: - Functions
    
    /// Filters the word list based on the selected category.
    func filterWords() {
        if selectedCategory == "All" {
            filteredWords = allWords
        } else {
            var results: [WordModel] = []
            for word in allWords {
                if word.category == selectedCategory {
                    results.append(word)
                }
            }
            filteredWords = results
        }
        currentWordIndex = 0
    }
    
    /// Updates the selected category and starts the game for that category.
    func selectCategory(_ category: String) {
        selectedCategory = category
        filterWords()
        isCategoryFinished = false
        setupNewRound()
        isGameActive = true
    }
    
    /// Returns to the main menu.
    func goBackToMenu() {
        isGameActive = false
        isCategoryFinished = false
        score = 0
        currentWordIndex = 0
    }
    
    /// Prepares a new round by resetting state and picking a word.
    func setupNewRound() {
        if let word = currentWord {
            displayScrambledWord = word.scrambledWord
        }
        userGuess = ""
        feedbackMessage = "Guess the word!"
        isHintRevealed = false
    }
    
    /// Checks the user's guess against the target word.
    func checkGuess() {
        isNewHighScore = false
        
        guard let target = currentWord?.targetWord else {
            return
        }
        
        if userGuess.uppercased() == target.uppercased() {
            score += 10
            feedbackMessage = "Correct! +10 points"
            
            // Update high score if needed
            if score > highScore {
                highScore = score
                isNewHighScore = true
                JSONStorageService.saveHighScore(highScore)
            }
            
            // Move to next word after a short delay or immediately
            self.nextWord()
        } else {
            feedbackMessage = "Not quite. Try again!"
        }
    }
    
    /// Advances to the next word in the list or finishes the category.
    func nextWord() {
        if filteredWords.isEmpty { return }
        
        if currentWordIndex < filteredWords.count - 1 {
            currentWordIndex += 1
            self.setupNewRound()
        } else {
            // Reached the end of the list
            isCategoryFinished = true
        }
    }
    
    /// Skips the current word with a penalty, only if the user has enough points.
    func skipWord() {
        if score >= 10 {
            score -= 10
            feedbackMessage = "Skipped. -10 points."
            self.nextWord()
        } else {
            feedbackMessage = "Not enough points to skip!"
        }
    }
    
    /// Reveals the hint for a point penalty, only if the user has enough points.
    func revealHint() {
        if !isHintRevealed {
            if score >= 5 {
                score -= 5
                isHintRevealed = true
                feedbackMessage = "Hint revealed! -5 points."
            } else {
                feedbackMessage = "Not enough points for a hint!"
            }
        }
    }
    
    /// Shuffles the current scrambled word again.
    func shuffleAgain() {
        guard let target = currentWord?.targetWord else { return }
        
        var characters = Array(target)
        // Manual Fisher-Yates shuffle to follow style guidelines (explicit loops)
        for i in 0..<(characters.count - 1) {
            let j = Int.random(in: i..<characters.count)
            characters.swapAt(i, j)
        }
        
        displayScrambledWord = String(characters)
    }
    
    /// Resets the game to the beginning.
    func restartGame() {
        score = 0
        currentWordIndex = 0
        isNewHighScore = false
        isCategoryFinished = false
        self.setupNewRound()
    }
}
