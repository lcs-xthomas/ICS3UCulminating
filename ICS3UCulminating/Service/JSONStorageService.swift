import Foundation

struct JSONStorageService {
    
    // MARK: - Stored properties
    private static let fileName = "highScore.json"
    
    // MARK: - Functions
    
    /// Returns the URL for the high score file in the Documents directory.
    private static func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    /// Saves the high score to a JSON file.
    static func saveHighScore(_ score: Int) {
        let url = getDocumentsDirectory().appendingPathComponent(fileName)
        
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(score)
            try data.write(to: url, options: [.atomicWrite])
        } catch {
            print("Unable to save high score: \(error.localizedDescription)")
        }
    }
    
    /// Loads the high score from a JSON file.
    /// Returns 0 if no file is found or if an error occurs.
    static func loadHighScore() -> Int {
        let url = getDocumentsDirectory().appendingPathComponent(fileName)
        
        // Check if the file exists before trying to read it
        if FileManager.default.fileExists(atPath: url.path) == false {
            return 0
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let score = try decoder.decode(Int.self, from: data)
            return score
        } catch {
            print("Unable to load high score: \(error.localizedDescription)")
            return 0
        }
    }
}
