//
//  EmojiView.swift
//  Widget-Sample
//
//  Created by ali on 7/16/20.
//


import SwiftUI

struct EmojiView: View {
    
    let emoji: Emoji
    let color: Color
    
    var body: some View {
        Text(emoji.icon)
            .font(.largeTitle)
            .padding()
            .background(color)
            .clipShape(Circle())
            
    }
}

struct EmojiViiew_Previews: PreviewProvider {
    static var previews: some View {
        let emoji = Emoji(icon: "😀", name: "Happy", description: "This means the user is about that life!")
        EmojiView(emoji: emoji, color: .green)
    }
}
