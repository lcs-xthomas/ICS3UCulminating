//
//  GameViewModel.swift
//  ICS3UCulminating
//

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
    var wordsSolved: Int = 0
    var feedbackMessage: String = ""
    var displayScrambledWord: String = ""
    
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
        self.loadGameData()
    }
    
    // MARK: - Functions
    
    /// Loads the word list and previous high score data.
    func loadGameData() {
        // Load words from the bundle
        self.words = JSONStorageService.shared.loadWordsFromBundle()
        
        // Load existing score data
        let savedScore = JSONStorageService.shared.loadScore()
        self.highScore = savedScore.highHighScore
        self.wordsSolved = savedScore.wordsSolved
        
        // Set the initial scrambled word
        if let firstWord = currentWord {
            displayScrambledWord = firstWord.scrambledWord
        }
    }
    
    /// Checks if the user's guess matches the target word.
    func checkGuess() {
        guard let target = currentWord?.targetWord else {
            return
        }
        
        if userGuess.uppercased() == target.uppercased() {
            score += 10
            wordsSolved += 1
            feedbackMessage = "Correct! Well done."
            
            // Check for new high score
            if score > highScore {
                highScore = score
                saveProgress()
            }
            
            // Move to next word
            self.nextWord()
        } else {
            feedbackMessage = "Try again!"
        }
    }
    
    /// Skips the current word and moves to the next one.
    func skipWord() {
        feedbackMessage = "Skipped. The word was: \(currentWord?.targetWord ?? "")"
        self.nextWord()
    }
    
    /// Advances to the next word in the list.
    func nextWord() {
        userGuess = ""
        if currentWordIndex < words.count - 1 {
            currentWordIndex += 1
        } else {
            // Reset to beginning
            currentWordIndex = 0
            feedbackMessage = "Back to the start!"
        }
        
        // Update the display word
        if let nextWordModel = currentWord {
            displayScrambledWord = nextWordModel.scrambledWord
        }
    }
    
    /// Re-shuffles the current scrambled word for the user.
    func shuffleCurrentWord() {
        if let word = currentWord {
            displayScrambledWord = self.shuffleLetters(in: word.targetWord)
        }
    }
    
    /// Shuffles the letters of a string manually.
    func shuffleLetters(in word: String) -> String {
        var chars = Array(word)
        // Fisher-Yates shuffle algorithm
        for i in 0..<(chars.count - 1) {
            let j = Int.random(in: i..<chars.count)
            chars.swapAt(i, j)
        }
        return String(chars)
    }
    
    /// Persists the current high score and progress.
    func saveProgress() {
        let scoreToSave = ScoreModel(highHighScore: highScore, wordsSolved: wordsSolved)
        JSONStorageService.shared.saveScore(scoreToSave)
    }
}
