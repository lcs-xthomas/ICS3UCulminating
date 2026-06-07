import Foundation

struct WordModel: Identifiable, Codable {
    
    // MARK: - Stored properties
    let id: UUID
    let targetWord: String
    let scrambledWord: String
    let hint: String
    let category: String
    
    // MARK: - Initializer
    init(id: UUID = UUID(), targetWord: String, scrambledWord: String, hint: String, category: String) {
        self.id = id
        self.targetWord = targetWord
        self.scrambledWord = scrambledWord
        self.hint = hint
        self.category = category
    }
}

// MARK: - Sample Data
extension WordModel {
    static var sampleWords: [WordModel] {
        let words: [WordModel] = [
            // Tech Category
            WordModel(targetWord: "SWIFT", scrambledWord: "FTWIS", hint: "Apple's modern programming language.", category: "Tech"),
            WordModel(targetWord: "XCODE", scrambledWord: "EDXOC", hint: "The environment where you build apps.", category: "Tech"),
            WordModel(targetWord: "IPHONE", scrambledWord: "PENHIO", hint: "Apple's flagship mobile device.", category: "Tech"),
            
            // Animals Category
            WordModel(targetWord: "GIRAFFE", scrambledWord: "FFERAGI", hint: "A very tall animal with a long neck.", category: "Animals"),
            WordModel(targetWord: "PENGUIN", scrambledWord: "NUGPIEN", hint: "A flightless bird that lives in the cold.", category: "Animals"),
            WordModel(targetWord: "ELEPHANT", scrambledWord: "TPHENALE", hint: "The largest land animal with a trunk.", category: "Animals"),
            
            // Food Category
            WordModel(targetWord: "PIZZA", scrambledWord: "ZZIPA", hint: "A cheesy Italian dish with a crust.", category: "Food"),
            WordModel(targetWord: "BURGER", scrambledWord: "RREBUG", hint: "A sandwich with a meat patty and bun.", category: "Food"),
            WordModel(targetWord: "PASTA", scrambledWord: "ASTAP", hint: "Italian noodles often served with sauce.", category: "Food")
        ]
        return words
    }
}
