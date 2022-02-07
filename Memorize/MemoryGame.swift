//
//  MemoryGame.swift
//  Memorize
//
//  Created by Danilo de Sousa on 06/02/22.
//

import Foundation

struct MemoryGame<CardContent> {
    struct Card {
        var isFacedUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
    
    private(set) var cards: Array<Card>
    
    func choose(_ card: Card) {
        
    }
    
    init(
        numberOfPairsOfCards: Int,
        createCardContent: (Int) -> CardContent
    ) {
        cards = Array<Card>()
        
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            let card = Card(content: content)
            cards.append(card)
            cards.append(card)
        }
    }
}
