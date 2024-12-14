//
//  ContentView.swift
//  Memorize
//
//  Created by Xavier on 12/9/24.
//

import SwiftUI

// Pretty much everything is a struct in SwiftUI
// Not a class, not OOP

// ContentView behaves like a View. Functions like, Functional Programmming.
// Behavior, how this struct behaves like.

let card = RoundedRectangle(cornerRadius: 12)

struct ContentView: View {
    // Computed Property. Everytime someone asks for body, it is run (read only). Not stored.
    let emojis = ["👻", "🎃", "🧛🏻‍♂️", "🧙‍♀️", "😈", "🧙‍♂️", "🧟‍♀️", "☠️"]
    
    @State var cardCount = 4
    
    var body: some View {
        VStack {
            ScrollView{
                cards
            }
            Spacer()
            cardCountAdjusters
        }
        .padding()
    }
    
    
    // by is used by the caller, offset is for implementation
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
        
    var cardRemover: some View {
        return cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
    
    var cardAdder: some View {
        return cardCountAdjuster(by: 1, symbol: "rectangle.stack.badge.plus.fill")
    }
    
    // Not a viewbuilder. Just a function.  HStack is one line of code.
    // This is implicit return.
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(emoji: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
    
    var cardCountAdjusters: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
}

struct CardView: View {
    let emoji: String
    //@State is a pointer, temporary state
    @State var isFaceUp = true
    
    var body: some View {
        ZStack {
            // Layer 1: Face-up side (white background + border + emoji)
            Group {
                card.fill(.white)      // White background
                card.strokeBorder()    // Border
                Text(emoji)            // Emoji
            }
            // All become invisible when face down
            .opacity(isFaceUp ? 1 : 0)
            
            // Layer 2: Face-down side (solid fill)
            // Becomes visible when face down
            card.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}



#Preview {
    ContentView()
}
