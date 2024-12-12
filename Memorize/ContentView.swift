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
struct ContentView: View {
    // Computed Property. Everytime someone asks for body, it is run (read only). Not stored.
    
    var body: some View {
        HStack {
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
    var isFaceUp: Bool = false
    
    var body: some View {
        ZStack {
            if isFaceUp {
                CardFrontView()
            } else {
                CardBackView()
            }
        }
    }
}


struct CardFrontView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .foregroundColor(.white)
        RoundedRectangle(cornerRadius: 12)
            .strokeBorder(lineWidth: 2)
        Text("👻").font(.largeTitle)
    }
}

struct CardBackView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 12)
    }
}









#Preview {
    ContentView()
}
