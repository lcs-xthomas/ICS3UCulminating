//
//  ScoreModel.swift
//  ICS3UCulminating
//

import Foundation

struct ScoreModel: Codable {
    
    // MARK: - Stored properties
    var highHighScore: Int
    var wordsSolved: Int
    
    // MARK: - Initializer
    init(highHighScore: Int = 0, wordsSolved: Int = 0) {
        self.highHighScore = highHighScore
        self.wordsSolved = wordsSolved
    }
}
