//
//  JSONStorageService.swift
//  ICS3UCulminating
//

import Foundation

class JSONStorageService {
    
    // MARK: - Stored properties
    static let shared = JSONStorageService()
    
    // MARK: - Functions
    
    /// Loads words from the local words.json file in the app bundle.
    func loadWordsFromBundle() -> [WordModel] {
        // Find the URL for the file in the app bundle
        guard let url = Bundle.main.url(forResource: "words", withExtension: "json") else {
            return []
        }
        
        do {
            // Read the data from the file
            let data = try Data(contentsOf: url)
            
            // Decode the JSON data into an array of WordModel
            let decoder = JSONDecoder()
            let words = try decoder.decode([WordModel].self, from: data)
            
            return words
        } catch {
            print("Error loading words from bundle: \(error)")
            return []
        }
    }
    
    /// Saves the score model to the app's Documents directory.
    func saveScore(_ score: ScoreModel) {
        // Get the URL for the Documents directory
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let archiveURL = documentsDirectory.appendingPathComponent("score_data.json")
        
        do {
            // Encode the score model into JSON data
            let encoder = JSONEncoder()
            let data = try encoder.encode(score)
            
            // Write the data to the Documents directory
            try data.write(to: archiveURL)
        } catch {
            print("Error saving score: \(error)")
        }
    }
    
    /// Loads the score model from the app's Documents directory.
    func loadScore() -> ScoreModel {
        // Get the URL for the Documents directory
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let archiveURL = documentsDirectory.appendingPathComponent("score_data.json")
        
        // If the file does not exist, return a default ScoreModel
        if FileManager.default.fileExists(atPath: archiveURL.path) == false {
            return ScoreModel()
        }
        
        do {
            // Read the data from the file
            let data = try Data(contentsOf: archiveURL)
            
            // Decode the JSON data into a ScoreModel
            let decoder = JSONDecoder()
            let score = try decoder.decode(ScoreModel.self, from: data)
            
            return score
        } catch {
            print("Error loading score: \(error)")
            return ScoreModel()
        }
    }
}
