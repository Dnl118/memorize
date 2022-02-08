//
//  ContentView.swift
//  Memorize
//
//  Created by Danilo de Sousa on 02/02/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            Text("Memorize!").font(.largeTitle)
            
            ScrollView {
                LazyVGrid(columns: [
                    GridItem(
                        .adaptive(minimum: 65)
                    )
                ]) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
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
    let card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            
            if card.isFacedUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                
                Text(card.content).font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0)
            } else {
                shape.fill().foregroundColor(.red)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static let model = EmojiMemoryGame()
    
    static var previews: some View {
        ContentView(viewModel: model)
            .preferredColorScheme(.dark)
        
        ContentView(viewModel: model)
            .preferredColorScheme(.light)
    }
}
