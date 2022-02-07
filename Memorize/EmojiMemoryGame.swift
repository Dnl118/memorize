//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Danilo de Sousa on 06/02/22.
//

import SwiftUI

class EmojiMemoryGame {
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            Emojis.vehicles[pairIndex]
        }
    }
    
    private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
}
