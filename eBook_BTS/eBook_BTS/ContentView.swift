//
//  ContentView.swift
//  eBook_BTS
//
//  Created by User11 on 2022/10/13.
//

import SwiftUI
import AVKit

let BGM: AVPlayerItem = AVPlayerItem(url: Bundle.main.url(forResource: "btssong", withExtension: "mp3")!)

struct ContentView: View {
    @State var player = AVQueuePlayer()
    @State var looper: AVPlayerLooper?
    
        var body: some View
        {
            
            TabView {
                Home(player: $player, Home: .constant(true))
                    .tabItem {
                          Image(systemName: "house.circle.fill")
                          Text("Home")
                    }
                Member(ShowSecondView: .constant(true), player: $player)
                    .tabItem {
                        Label("BTS Member", systemImage: "figure.wave.circle")
                    }
                Song(ShowThirdView: .constant(true), player: $player)
                    .tabItem {
                        Label("BTS Song", systemImage: "music.note")
                    }
            }
            .onAppear {
                if self.looper == nil {
                    self.looper = AVPlayerLooper(player: self.player, templateItem: BGM)
                    self.player.volume = 0.5
                    self.player.play()
        }
}
        }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
        ContentView()
            .environment(\.colorScheme, .dark)
    }
}
