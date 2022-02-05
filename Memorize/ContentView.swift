//
//  ContentView.swift
//  Memorize
//
//  Created by Danilo de Sousa on 02/02/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var emojis = Emojis.vehicles.shuffled()
    
    var emojisCount: Int {
        return emojis.count
    }
    
    var body: some View {
        VStack {
            Text("Memorize!").font(.largeTitle)
            
            ScrollView {
                LazyVGrid(columns: [
                    GridItem(
                        .adaptive(minimum: 65)
                    )
                ]) {
                    ForEach(emojis[0..<emojisCount], id: \.self) {
                        CardView(content: $0).aspectRatio(2/3, contentMode: .fit)
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
            emojis = Emojis.vehicles.shuffled()
        } label: {
            VStack {
                Image(systemName: "car")
                Text("Vehicles").font(.footnote)
            }
        }
    }
    
    var nature: some View {
        Button {
            emojis = Emojis.nature.shuffled()
        } label: {
            VStack {
                Image(systemName: "leaf")
                Text("Nature").font(.footnote)
            }
        }
    }
    
    var sports: some View {
        Button {
            emojis = Emojis.sports.shuffled()
        } label: {
            VStack {
                Image(systemName: "sportscourt")
                Text("Sports").font(.footnote)
            }
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
