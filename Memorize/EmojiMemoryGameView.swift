//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Danilo de Sousa on 02/02/22.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var game: EmojiMemoryGame
    
    var body: some View {
        VStack {
            Text("Memorize!").font(.largeTitle)
            
            AspectVGrid(items: game.cards, aspectRatio: 2/3) { card in
                if card.isMatched && card.isFacedUp {
                    Rectangle().opacity(0)
                } else {
                    CardView(card: card)
                        .padding(4)
                        .onTapGesture {
                            game.choose(card)
                        }
                }
            }
            .foregroundColor(.red)
            
            Spacer()
            
            HStack {
                vehicles
                Spacer()
                nature
                Spacer()
                sports
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
    
    var vehicles: some View {
        Button {
            //            emojis = Emojis.vehicles.shuffled()
        } label: {
            VStack {
                Image(systemName: "car")
                Text("Vehicles").font(.footnote)
            }
        }
    }
    
    var nature: some View {
        Button {
            //            emojis = Emojis.nature.shuffled()
        } label: {
            VStack {
                Image(systemName: "leaf")
                Text("Nature").font(.footnote)
            }
        }
    }
    
    var sports: some View {
        Button {
            //            emojis = Emojis.sports.shuffled()
        } label: {
            VStack {
                Image(systemName: "sportscourt")
                Text("Sports").font(.footnote)
            }
        }
    }
}

struct CardView: View {
    let card: EmojiMemoryGame.Card
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                
                if card.isFacedUp {
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
                    Pie(startAngle: Angle(degrees: 0 - 90), endAngle: Angle(degrees: 110 - 90))
                    Text(card.content).font(font(in: geometry.size))
                } else if card.isMatched {
                    shape.opacity(0)
                } else {
                    shape.fill().foregroundColor(.red)
                }
            }
        }
    }
    
    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale)
    }
    
    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 20
        static let lineWidth: CGFloat = 3
        static let fontScale: CGFloat = 0.7
    }
}

struct ContentView_Previews: PreviewProvider {
    static let game = EmojiMemoryGame()
    
    static var previews: some View {
        game.choose(game.cards.first!)
        
        return EmojiMemoryGameView(game: game)
            .preferredColorScheme(.dark)
    }
}
