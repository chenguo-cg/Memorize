//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Guo Chen on 10/11/22.
//

import SwiftUI

//func makeCardContent(index: Int) -> String {
//    return "😀"
//}



// When you copy a class, you end up with two references to one instance of the data.
class EmojiMemoryGame {
    //When we define any variable as static, it gets attached to a class rather than an object.
    static let emojis = ["🚁", "🚘", "⛴", "🚀", "🚗", "🚕","🛵","🚖", "🛰", "🚑", "🚒", "🚙", "🚜", "🛻", "🚐", "🚍", "🚇", "🛸", "🛶", "⛵️", "🚤", "🛥", "🚂", "🦽"]
    
    static func createMemoryGame() -> MemoryGame<String>{
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            //same as EmojiMemoryGame.emojis[pairIndex], but because we are using a static type inside a static function, we dont need to specify
            emojis[pairIndex]
        }
    }
    //same as private var model: MemoryGame<String> = EmojiMemoryGame.createMmemoryGame(), because we are using it for initialization
    private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    //for example, we have to type the whole thing in here
    //func foo() {
    //    let x = EmojiMemoryGame.emojis
    //}
}

