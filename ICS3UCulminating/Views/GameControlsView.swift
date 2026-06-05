//
//  GameControlsView.swift
//  ICS3UCulminating
//

import SwiftUI

struct GameControlsView: View {
    
    // MARK: - Stored properties
    @Bindable var viewModel: GameViewModel
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 20) {
            TextField("Type your guess here...", text: $viewModel.userGuess)
                .textFieldStyle(.roundedBorder)
                .font(.title3)
                .multilineTextAlignment(.center)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.characters)
                .onSubmit {
                    viewModel.checkGuess()
                }
            
            HStack(spacing: 15) {
                Button(action: {
                    viewModel.checkGuess()
                }) {
                    Text("Submit")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.accentColor)
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                
                Button(action: {
                    viewModel.skipWord()
                }) {
                    Text("Skip")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.secondary.opacity(0.2))
                        .foregroundColor(.primary)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
        }
    }
}
