//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Guo Chen on 10/10/22.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
