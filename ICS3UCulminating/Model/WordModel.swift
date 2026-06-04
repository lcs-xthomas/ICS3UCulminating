//
//  WordModel.swift
//  ICS3UCulminating
//

import Foundation

struct WordModel: Codable, Identifiable {
    
    // MARK: - Stored properties
    let id: UUID
    let targetWord: String
    let scrambledWord: String
    let hint: String
    
    // MARK: - Initializer
    init(id: UUID = UUID(), targetWord: String, scrambledWord: String, hint: String) {
        self.id = id
        self.targetWord = targetWord
        self.scrambledWord = scrambledWord
        self.hint = hint
    }
}
