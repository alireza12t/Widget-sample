//
//  ContentView.swift
//  Widget-Sample
//
//  Created by ali on 7/16/20.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("emoji", store: UserDefaults(suiteName: "group.me.toghyiani.alireza.Widget-Sample"))
    var emojiData: Data = Data()
    
    
    let emojis = [
        Emoji(icon: "😀", name: "Happy", description: "This means the user is about that life!"),
        Emoji(icon: "😐", name: "Stare", description: "That just happened; right here in front of me..."),
        Emoji(icon: "🤬", name: "Heated", description: "Completely done with your ish Karen!")
    ]
    
    var body: some View {
        NavigationView{
            VStack(spacing: 40) {
        ForEach(emojis) { emoji in
            EmojiView(emoji: emoji, color: .green)
                .onTapGesture {
                    save(emoji)
                }
        }
        }
        .navigationTitle("Emoji List 😎")
        }
    }
    
    func save(_ emoji: Emoji) {
        guard let emojiData = try? JSONEncoder().encode(emoji) else { return }
        self.emojiData = emojiData
        print("save \(emoji)")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
