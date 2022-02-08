//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Danilo de Sousa on 06/02/22.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 12) { pairIndex in
            Emojis.vehicles[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    var cardsCount: Int {
        return model.cards.count
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
