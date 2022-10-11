//
//  ContentView.swift
//  Memorize
//
//  Created by Guo Chen on 10/10/22.
//

import SwiftUI


struct travelThemeView: View {
    @State var travelEmojis = ["🚁", "🚘", "⛴", "🚀", "🚗", "🚕","🛵","🚖", "🛰", "🚑", "🚒", "🚙", "🚜", "🛻", "🚐", "🚍", "🚇", "🛸", "🛶", "⛵️", "🚤", "🛥", "🚂", "🦽"]
    
    @State var emojiCount  = 24
    
    var body: some View {
        VStack {
            Text("Memorize!").font(.title)
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(travelEmojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .onAppear(perform: {
                travelEmojis.shuffle()
            })
            .foregroundColor(.red)
        }
        .padding(.horizontal)
    }
    var remove: some View {
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
    }
    var add: some View {
        Button{
            if emojiCount < travelEmojis.count {
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
        }
    }
}

struct fruitThemeView: View {
    @State var fruitEmojis = ["🍏", "🍊", "🍌", "🍉", "🍇", "🥥", "🍍", "🫐", "🍓", "🍈", "🍒", "🍑"]

    @State var emojiCount  = 12
    
    var body: some View {
        VStack {
            Text("Memorize!").font(.title)
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(fruitEmojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .onAppear(perform: {
                fruitEmojis.shuffle()
            })
            .foregroundColor(.red)

        }
        .padding(.horizontal)
    }
    var remove: some View {
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
    }
    var add: some View {
        Button{
            if emojiCount < fruitEmojis.count {
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
        }
    }
}

struct animalThemeView: View {
    @State var animalEmojis = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨", "🐯", "🦁", "🐮", "🐷", "🐵", "🐸"]
    
    @State var emojiCount  = 16
    
    var body: some View {
        VStack {
            Text("Memorize!").font(.title)
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(animalEmojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .onAppear(perform: {
                animalEmojis.shuffle()
            })
            .foregroundColor(.red)
            Spacer()

        }
        .padding(.horizontal)
    }
    var remove: some View {
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
    }
    var add: some View {
        Button{
            if emojiCount < animalEmojis.count {
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
        }
    }
}

struct ContentView: View {
    var body: some View{
        TabView {
            travelThemeView()
                .tabItem{
                    Image(systemName: "car").font(.system(size: 60))
                    Text("Travel")
                }
            animalThemeView()
                .tabItem{
                    Image(systemName: "pawprint")
                    Text("Animal")
                }
            fruitThemeView()
                .tabItem{
                    Image(systemName: "heart")
                    Text("Food")
                }
        }
    }
}


struct CardView: View {
    @State var isFaceUp: Bool = true
    var content: String
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else{
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

































struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
    }
}
