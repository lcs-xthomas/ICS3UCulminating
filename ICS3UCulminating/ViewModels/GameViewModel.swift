import Foundation
import Observation

@Observable
class GameViewModel {
    
    // MARK: - Stored properties
    var words: [WordModel] = []
    var currentWordIndex: Int = 0
    var userGuess: String = ""
    var score: Int = 0
    var highScore: Int = 0
    var feedbackMessage: String = ""
    var displayScrambledWord: String = ""
    var isNewHighScore: Bool = false
    
    // MARK: - Computed properties
    var currentWord: WordModel? {
        if words.isEmpty {
            return nil
        }
        if currentWordIndex < words.count {
            return words[currentWordIndex]
        }
        return nil
    }
    
    // MARK: - Initializer
    init() {
        self.words = WordModel.sampleWords
        self.highScore = JSONStorageService.loadHighScore()
        
        // Start the first round
        self.setupNewRound()
    }
    
    // MARK: - Functions
    
    /// Prepares a new round by resetting state and picking a word.
    func setupNewRound() {
        if let word = currentWord {
            displayScrambledWord = word.scrambledWord
        }
        userGuess = ""
        feedbackMessage = "Guess the word!"
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
    
    /// Advances to the next word in the list.
    func nextWord() {
        if currentWordIndex < words.count - 1 {
            currentWordIndex += 1
        } else {
            // Loop back to the start or finish game
            currentWordIndex = 0
        }
        
        self.setupNewRound()
    }
    
    /// Skips the current word.
    func skipWord() {
        feedbackMessage = "Skipped. The word was \(currentWord?.targetWord ?? "")."
        self.nextWord()
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
        self.setupNewRound()
    }
}
