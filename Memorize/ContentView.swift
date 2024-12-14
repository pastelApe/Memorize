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
    let emojis = ["👻", "🎃", "🧛🏻‍♂️", "🧙‍♀️"]
    
    var body: some View {
        HStack {
            ForEach(emojis.indices, id: \.self) { emoji in
                CardView(emoji: emojis[emoji])
            }
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
    @State var isFaceUp = true //@State is a pointer, temporary state
    
    let emoji: String
    
    var body: some View {
        ZStack {
            if isFaceUp {
                CardFrontView(thisEmoji: emoji)
            } else {
                CardBackView()
            }
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}


struct CardFrontView: View {
    let thisEmoji: String
    
    var body: some View {
        card.foregroundColor(.white)
        card.strokeBorder(lineWidth: 2)
        Text(thisEmoji).font(.largeTitle)
    }
}

struct CardBackView: View {
    var body: some View {
        card.fill()
    }
}









#Preview {
    ContentView()
}
