//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Guo Chen.
//

import SwiftUI

//func makeCardContent(index: Int) -> String {
//    return "😀"
//}

// When you copy a class, you end up with two references to one instance of the data.
class EmojiMemoryGame: ObservableObject {
    
    init() {
        theme = EmojiMemoryGame.themes.randomElement()!
        theme.emojis.shuffle()
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
    

    static var themes: [Theme] = [
        Theme(name: "Travel", emojis: ["🚁", "🚘", "⛴", "🚀", "🚗", "🚕","🛵","🚖", "🛰", "🚑", "🚒", "🚙", "🚜", "🛻", "🚐", "🚍", "🚇", "🛸", "🛶", "⛵️", "🚤", "🛥", "🚂", "🦽"], numberOfPairsOfCards: 8, themeColor: "red"),
        Theme(name: "Animal", emojis: ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊","🐻","🐼", "🐻‍❄️", "🐨", "🐯", "🦁", "🐮", "🐷", "🐸", "🐵"], numberOfPairsOfCards: 7, themeColor: "yellow"),
        Theme(name: "Fruit", emojis: ["🍏", "🍊", "🍋", "🍌", "🍉", "🍇","🍓","🫐", "🍒", "🍑", "🍍", "🥥"], numberOfPairsOfCards: 6, themeColor: "green"),
        Theme(name: "Weather", emojis: ["🌈", "🌪", "🌩", "🌦", "☁️", "☀️","🌤","🌨", "❄️", "☃️", "⛄️", "⛈"], numberOfPairsOfCards: 5, themeColor: "cyan"),
        Theme(name: "Food", emojis: ["🥐", "🍙", "🧀", "🍳", "🥩", "🍖","🌭","🍟", "🍕", "🍥", "🥟", "🥗", "🍢", "🫕", "🍭", "🍣"], numberOfPairsOfCards: 4, themeColor: "orange"),
        Theme(name: "Sport", emojis: ["⚽️", "🏀", "🥏", "🎱", "🥎", "🥊","⛸","🏓"], numberOfPairsOfCards: 5, themeColor: "blue")
    ]
    
    static func createMemoryGame(theme: Theme) -> MemoryGame<String> {
        MemoryGame(numberOfPairsOfCards: theme.numberOfPairsOfCards) { pairIndex in theme.emojis[pairIndex] }
    }
    
    // each Model-View creates its own Model
    @Published private var model: MemoryGame<String>
    
    // and declare its own var for parts that need to be available
    var cards: [MemoryGame<String>.Card] {
        return model.cards
    }
    
    private var theme: Theme
    
    var themeName: String {
        return theme.name
    }
    
    var themeColor: Color {
        switch theme.themeColor {
        case "red": return .red
        case "yellow": return .yellow
        case "orange": return .orange
        case "blue": return .blue
        case "gray": return .gray
        case "green": return .green
        case "cyan": return .cyan
        case "indigo": return .indigo
        case "teal": return .teal
        default: return .black
        }
    }
    
    var score: Int {
        return model.score
    }
    
    // put functions that show user intent in the viewModel
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    func newGame() {
        theme = EmojiMemoryGame.themes.randomElement()!
        theme.emojis.shuffle()
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
}
