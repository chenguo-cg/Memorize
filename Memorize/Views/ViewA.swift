//
//  ViewA.swift
//  Memorize
//
//  Created by Guo Chen on 10/10/22.
//

import SwiftUI

struct ViewA: View {
    var travelEmojis = ["🚁", "🚘", "⛴", "🚀", "🚗", "🚕","🛵","🚖", "🛰", "🚑", "🚒", "🚙", "🚜", "🛻", "🚐", "🚍", "🚇", "🛸", "🛶", "⛵️", "🚤", "🛥", "🚂", "🦽"]
    @State var emojiCount  = 20

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
            .foregroundColor(.red)
            Spacer()
            HStack{
                remove
                Spacer()
                add
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)    }
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

struct ViewA_Previews: PreviewProvider {
    static var previews: some View {
        ViewA()
    }
}
