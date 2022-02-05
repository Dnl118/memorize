//
//  ContentView.swift
//  Memorize
//
//  Created by Danilo de Sousa on 02/02/22.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["✈️", "🏍", "🚔", "🚜", "🏎", "🛵", "🚛", "🚍", "🚝", "🚂", "🛰", "🛩", "🛸", "🛳", "🚢", "⛴", "🚎", "🚌", "🚒", "🛴", "🚲", "🚅"]
    
    @State var emojiCount = 4
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [
                    GridItem(
                        .adaptive(minimum: 65)
                    )
                ]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) {
                        CardView(content: $0).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            
            Spacer()
            
            HStack {
                removeButton
                Spacer()
                addButton
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
    
    var removeButton: some View {
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
    }
    
    var addButton: some View {
        Button {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
        }
    }
}

struct CardView: View {
    let content: String
    
    @State var isFaceUp = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                
                Text(content).font(.largeTitle)
            } else {
                shape.fill().foregroundColor(.red)
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
.previewInterfaceOrientation(.portrait)
        
        ContentView()
            .preferredColorScheme(.light)
    }
}
