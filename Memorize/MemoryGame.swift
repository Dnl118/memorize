//
//  MemoryGame.swift
//  Memorize
//
//  Created by Danilo de Sousa on 06/02/22.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    
    private(set) var cards: Array<Card>
    
    private var indexOfTheOnlyAndOneFaceUpCard: Int? {
        get { cards.indices.filter({ cards[$0].isFacedUp }).oneAndOnly }
        set { cards.indices.forEach { cards[$0].isFacedUp = ($0 == newValue) } }
    }
    
    mutating func choose(_ card: Card) {
        guard let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
        !cards[chosenIndex].isFacedUp,
        !cards[chosenIndex].isMatched else {
            return
        }
        
        if let potentialMatchIndex = indexOfTheOnlyAndOneFaceUpCard {
            if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                cards[chosenIndex].isMatched = true
                cards[potentialMatchIndex].isMatched = true
            }
            cards[chosenIndex].isFacedUp = true
        } else {
            indexOfTheOnlyAndOneFaceUpCard = chosenIndex
        }
    }
    
    init(
        numberOfPairsOfCards: Int,
        createCardContent: (Int) -> CardContent
    ) {
        cards = []
        
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            
            cards.append(
                Card(content: content, id: pairIndex * 2)
            )
            cards.append(
                Card(content: content, id: pairIndex * 2 + 1)
            )
        }
    }
    
    struct Card: Identifiable {
        var isFacedUp = false
        var isMatched = false
        
        let content: CardContent
        
        // Identifiable stub
        let id: Int
    }
}

fileprivate extension Array {
    var oneAndOnly: Element? {
        count == 1 ? first : nil
    }
}
