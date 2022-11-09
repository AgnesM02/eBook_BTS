//
//  Song.swift
//  eBook_BTS
//
//  Created by User11 on 2022/10/13.
//

import AVKit
import SwiftUI

struct Song: View {
    @State private var Home = false
    @State private var ShowSecondView = false
    
    @Binding var ShowThirdView: Bool
    @Binding var player: AVQueuePlayer
    
    let videoplayer1 = AVPlayer(url: Bundle.main.url(forResource: "bts-louder", withExtension: "mp4")!)
    let videoplayer2 = AVPlayer(url: Bundle.main.url(forResource: "runbts", withExtension: "mp4")!)
    
    let albums = ["album 0",
                 "album 1",
                 "album 2",
                 "album 3",
                 "album 4",
                 "album 5",
                 "album 6",
                 "album 7",
                 "album 8",
                 "album 9",
                 "album 10",
                 "album 11",
                 "album 12",
                 "album 13",
                 "album 14",
                 "album 15",
                 "album 16",
                 "album 17",
                ]

    
    var body: some View {
    ZStack {
        Image("btswall")
                .resizable()
                .ignoresSafeArea()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        
        
        ScrollView(.vertical)
        {
            ZStack(alignment: .bottom)
                {
                VStack{
                VStack
                {
                    Text("BTS Song")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(Color.purple)
                    Spacer().frame(height :30)
                    
                    VideoPlayer(player: videoplayer2, videoOverlay: {
                        VStack(alignment: .leading) { // 2
                            Text("BTS - Run BTS")
                                .foregroundColor(Color.gray)
                                .bold()
                                .font(Font.title2)
                                .padding(.all, 10)
                            Spacer()
                        }
                    })
                        .frame(width : 300, height: 200)
                        .onAppear() {
                            videoplayer2.play()
                            self.videoplayer2.pause()
                        }
                        .onDisappear {
                            videoplayer2.pause()}
                    
                    Spacer().frame(height :10)
                    
                    Text("Desc:")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.purple)
                    Text("In the first chorus, BTS say how they go through a significant suffering, described as breaking louder than bombs,” the website reads.Throughout the song, they describe how they hope for better days and then leading into how they will fight against any hard times while accepting it as they chose to be artists.")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.purple)
                        .frame(width: 300)
                }
    //===============================================================
                    Spacer().frame(height :30)
                    
                VStack{
                    VideoPlayer(player: videoplayer1, videoOverlay: {
                        VStack(alignment: .leading) { // 2
                            Text("BTS - Louder Than Bombs")
                                .foregroundColor(Color.gray)
                                .bold()
                                .font(Font.title2)
                                .padding(.all, 10)
                            Spacer()
                        }
                    })
                        .frame(width : 300, height: 200)
                        .onAppear() {
                            videoplayer1.play()
                            self.videoplayer1.pause()
                        }
                        .onDisappear {
                            videoplayer1.pause()}
                    
                    Spacer().frame(height :10)
                    
                        Text("Desc:")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.purple)
                        Text("Ultimately, Run BTS's lyrical throughline centers on BTS's determination to never lose their spirit and avoid negativity (no matter how naive or foolish they may seem to outsiders) with lines like, 'Not losing our spirit', 'Run bulletproof, run, yeah, you gotta run', and 'With the ignorant faith, just run, with your two legs.'After nine years, BTS has yet to lose the spirit they cultivated in that tiny dorm in Nonhyeon-dong, and as the lyrics of 'Run BTS' say, they'll continue to run resiliently forward past any hurdles—like they're bulletproof.")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.purple)
                            .frame(width: 300)
                    
                }
                }
                
            }
            
            Spacer().frame(height :50)
            
            Text("BTS 2013-2022 ALBUMS")
                .font(.system(size: 20))
                .fontWeight(.bold)
                .foregroundColor(Color.purple)
            
            ScrollView(.horizontal) {
                    let rows = [GridItem()]
                        LazyHGrid(rows: rows) {
                        ForEach(albums.indices, id: \.self) { item in
                            albumView(album: albums[item], number: item + 1)
                                  }
                              }.padding(.top, 10)
                             
                      }.fixedSize(horizontal: false, vertical: true)

        }
      
}
}
}
struct albumView: View {
    let album: String
   let number: Int
    var body: some View {
        VStack {
            Image(album)
                .resizable()
                .scaledToFit()
                .frame(width: 130, height: 150)
                .clipped()
           }
}
}

struct Song_Previews: PreviewProvider {
    @State static var player = AVQueuePlayer()
    
    static var previews: some View {
        Group {
            Song(ShowThirdView: .constant(true), player: $player)
        }
    }
}
