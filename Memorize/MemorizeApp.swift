//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Danilo de Sousa on 02/02/22.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
