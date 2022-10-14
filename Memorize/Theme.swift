//
//  Theme.swift
//  Memorize
//
//  Created by Guo Chen on 10/13/22.
//

import Foundation

struct Theme {
    var name: String
    var emojis: [String]
    var numberOfPairsOfCards: Int
    var themeColor: String
    
    init(name: String, emojis: [String], numberOfPairsOfCards: Int, themeColor: String) {
        self.name = name
        self.emojis = emojis
        if numberOfPairsOfCards > emojis.count {
            self.numberOfPairsOfCards = emojis.count
        } else {
            self.numberOfPairsOfCards = numberOfPairsOfCards
        }
        self.themeColor = themeColor
    }
}
