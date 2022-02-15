//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Danilo de Sousa on 06/02/22.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 12) { pairIndex in
            Emojis.vehicles[pairIndex]
        }
    }
    
    @Published private var model = createMemoryGame()
    
    var cards: Array<Card> {
        return model.cards
    }
    
    var cardsCount: Int {
        return model.cards.count
    }
    
    func choose(_ card: Card) {
        model.choose(card)
    }
}
