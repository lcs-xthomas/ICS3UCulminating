import Foundation

struct WordModel: Identifiable, Codable {
    
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

// MARK: - Sample Data
extension WordModel {
    static var sampleWords: [WordModel] {
        let words: [WordModel] = [
            WordModel(
                targetWord: "SWIFT",
                scrambledWord: "FTWIS",
                hint: "Apple's modern programming language."
            ),
            WordModel(
                targetWord: "XCODE",
                scrambledWord: "EDXOC",
                hint: "The environment where you build apps."
            ),
            WordModel(
                targetWord: "IPHONE",
                scrambledWord: "PENHIO",
                hint: "Apple's flagship mobile device."
            ),
            WordModel(
                targetWord: "WIDGET",
                scrambledWord: "GETWID",
                hint: "A small app component for the home screen."
            ),
            WordModel(
                targetWord: "CANVAS",
                scrambledWord: "SVANAC",
                hint: "The area where you preview SwiftUI views."
            )
        ]
        return words
    }
}
