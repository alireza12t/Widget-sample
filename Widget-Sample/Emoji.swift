//
//  Emoji.swift
//  Sexy-Widget
//
//  Created by Kyle Lee on 6/23/20.
//

import Foundation

struct Emoji: Identifiable, Codable {
    let icon: String
    let name: String
    let description: String
    
    var id: String { icon }
}
