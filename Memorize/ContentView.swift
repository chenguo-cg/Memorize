//
//  ContentView.swift
//  Memorize
//
//  Created by Guo Chen on 10/10/22.
//

import SwiftUI

struct ContentView: View {
    // @ObservedObject: when viewModel says sth changed, plz rebuild my entire body
    @ObservedObject var viewModel: EmojiMemoryGame
    
    //shows what's in the model
    var body: some View {
        VStack{
            HStack{
                Text(viewModel.themeName).font(.largeTitle)
                Spacer()
                Text("Score: \(viewModel.score)").font(.largeTitle)
            }
            .padding()
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(viewModel.cards) { card in // bag of lego View!
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                // ask viewModel to express User intent
                                viewModel.choose(card)
                            }
                    }
                }
            }
            .padding(.horizontal)

            Button(action: {
                viewModel.newGame()
            }, label: {
                Text("New Game").font(.largeTitle)
            })
            .buttonStyle(GrowingButton())
        }
        .foregroundColor(viewModel.themeColor)

    }
}

// View that shows what the card looks like
struct CardView: View {
    let card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0)
            } else {
                shape.fill()
            }
        }
    }
}

struct GrowingButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(.white)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}


















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
    }
}
