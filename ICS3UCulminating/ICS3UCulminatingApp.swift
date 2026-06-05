import SwiftUI

@main
struct ICS3UCulminatingApp: App {
    
    // MARK: - Stored properties
    @State private var viewModel = GameViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(viewModel)
        }
    }
}
