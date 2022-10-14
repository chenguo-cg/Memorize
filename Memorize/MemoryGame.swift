import Darwin
struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: [Card]
    private var IndexOfTheOneAndOnlyFaceUpCard: Int?
    private(set) var score = 0
    
    mutating func choose(_ card: Card) {
        if let choosenIndex = cards.firstIndex(where: {$0.id == card.id}),
           !cards[choosenIndex].isFaceUp,
           !cards[choosenIndex].isMatched
        {
            if let potentialMatchIndex = IndexOfTheOneAndOnlyFaceUpCard {
                if cards[choosenIndex].content == cards[potentialMatchIndex].content {
                    cards[choosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    score += 2
                } else {
                    if cards[choosenIndex].alreadySeen || cards[potentialMatchIndex].alreadySeen {
                        score -= 1
                    }
                }
                IndexOfTheOneAndOnlyFaceUpCard = nil
            } else {
                for index in cards.indices {
                    if cards[index].isFaceUp == true {
                        cards[index].isFaceUp = false
                        cards[index].alreadySeen = true
                    }
                }
                IndexOfTheOneAndOnlyFaceUpCard = choosenIndex
            }
            cards[choosenIndex].isFaceUp.toggle()
        }
        print("\(cards)")
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = []
        // add numberOfPairsOfCards * 2 cards to cards array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
        cards.shuffle()
        
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var alreadySeen: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
    
}
