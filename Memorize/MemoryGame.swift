//
//  MemoryGame.swift
//  Memorize
//
//  Created by Guo Chen on 10/11/22.
//

import Foundation

//When you copy a struct, you end up with two unique copies of the data. 
struct MemoryGame<CardContent> {
    //Private setter means the variable can be set inside the class in which it is declared in. It will behave like readonly property outside that class's scope.
    private(set) var cards: Array<Card>
    
    func chooce(_ card: Card) {
        
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent){
        cards = Array<Card>()
        //add numberOfPairsOfCards x 2 cards to cards array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    struct Card {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        //CardContent is a generic type, could be a string(emoji), or image like JPEG
        var content: CardContent
    }
}
