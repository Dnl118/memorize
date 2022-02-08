//
//  MemoryGame.swift
//  Memorize
//
//  Created by Danilo de Sousa on 06/02/22.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    struct Card: Identifiable {
        var isFacedUp: Bool = false
        var isMatched: Bool = false
        
        let content: CardContent
        
        // Identifiable stub
        let id: Int
    }
    
    private(set) var cards: Array<Card>
    
    private var indexOfTheOnlyAndOneFaceUpCard: Int?
    
    mutating func choose(_ card: Card) {
        guard let chosenIndex = cards.firstIndex(where: {
            $0.id == card.id
        }),
              !cards[chosenIndex].isFacedUp,
              !cards[chosenIndex].isMatched else {
                  return
              }
        
        if let potentialMatchIndex = indexOfTheOnlyAndOneFaceUpCard {
            if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                cards[chosenIndex].isMatched = true
                cards[potentialMatchIndex].isMatched = true
            }
            
            indexOfTheOnlyAndOneFaceUpCard = nil
        } else {
            for i in cards.indices {
                cards[i].isFacedUp = false
            }
            
            indexOfTheOnlyAndOneFaceUpCard = chosenIndex
        }
        
        cards[chosenIndex].isFacedUp.toggle()
    }
    
    init(
        numberOfPairsOfCards: Int,
        createCardContent: (Int) -> CardContent
    ) {
        cards = Array<Card>()
        
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
}
