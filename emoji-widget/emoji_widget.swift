//
//  emoji_widget.swift
//  emoji-widget
//
//  Created by ali on 7/16/20.
//

import WidgetKit
import SwiftUI

struct EmojiEntry: TimelineEntry {
    var date: Date = Date()
    var emoji: Emoji
}


struct Provider: TimelineProvider {
    
    @AppStorage("emoji", store: UserDefaults(suiteName: "group.me.toghyiani.alireza.Widget-Sample"))
    var emojiData: Data = Data()
    
    func snapshot(with context: Context, completion: @escaping (EmojiEntry) -> ()) {
        guard let emoji = try? JSONDecoder().decode(Emoji.self, from: emojiData) else { return }
        let entry = EmojiEntry(emoji: emoji)
        completion(entry)
    }
    
    func timeline(with context: Context, completion: @escaping (Timeline<EmojiEntry>) -> ()) {
        guard let emoji = try? JSONDecoder().decode(Emoji.self, from: emojiData) else { return }
        
        let entry = EmojiEntry(emoji: emoji)
        let timeLine = Timeline(entries: [entry], policy: .atEnd)
        completion(timeLine)
    }
}


struct PlaceHolderView: View {
    var body: some View {
        EmojiView(emoji: Emoji(icon: "😵", name: "N/A", description: "N/A"), color: .blue)
    }
}


struct WidgetEntryView: View {
    let entry: Provider.Entry
    
    @Environment(\.widgetFamily) var family

    
    @ViewBuilder
    var body: some View {
        switch family {
        case .systemSmall:
            EmojiView(emoji: entry.emoji, color: .green)
        case .systemMedium:
            HStack {
                VStack {
                    Text(entry.emoji.name)
                        .font(.largeTitle)
                        .foregroundColor(.black)
                    Text(entry.emoji.description)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                EmojiView(emoji: entry.emoji, color: .green)
            }
        default:
            VStack {
                EmojiView(emoji: entry.emoji, color: .green)
                Text(entry.emoji.name)
                    .font(.largeTitle)
                    .foregroundColor(.black)
                Text(entry.emoji.description)
                    .font(.caption)
                    .foregroundColor(.gray)
                Spacer()
            }
        }
    }
}


@main
struct EmojiWidget: Widget {
    private var kind = "emoji_widget"
    
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider(), placeholder: PlaceHolderView()) { entry in
            WidgetEntryView(entry: entry)
        }
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
    }
    
}
//
//struct emoji_widget_Previews: PreviewProvider {
//
//    static var previews: some View {
//        let emoji = Emoji(icon: "😀", name: "Happy", description: "This means the user is about that life!")
//
//        VStack {
//            EmojiView(emoji: emoji, color: .green)
//            Spacer()
//            Text(emoji.name)
//                .font(.largeTitle)
//                .foregroundColor(.black)
//            Text(emoji.description)
//                .font(.caption)
//                .foregroundColor(.gray)
//        }
//    }
//}
