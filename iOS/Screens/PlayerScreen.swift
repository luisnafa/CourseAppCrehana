//
//  ContentView.swift
//  Shared
//
//  Created by Nafarrate, Luis on 22/10/21.
//

import SwiftUI
import UIKit
import AVKit
import AVFoundation

let chapters = ["Proyecto final", "Proyecto final", "Proyecto final"]

struct PlayerScreen: View {
    let padding: CGFloat = 16
    let widthForHeader = UIScreen.main.bounds.width - (16 * 2)
    
    init(){
        UITableView.appearance().backgroundColor = UIColor(Colors.darkBackground)
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                VideoPlayer(player: AVPlayer(url: URL(string: "https://crehana-videos.akamaized.net/outputs/trailer/89ef7d652e4549709347f89aa7be0f57/1f68b3fffd1641c0b03d1457a53808d4.m3u8")!))
                    .frame(width: geometry.size.width, height: 211)
                
                PlayerHeader()
                
                List {
                    ForEach(chapters, id:\.self) {
                        ChapterCell(title: "\($0)")
                    }.listRowBackground(Colors.darkBackground)
                }
            }
        }.background(Colors.darkBackground)
    }
}

extension View {
    func Print(_ vars: Any...) -> some View {
        for v in vars { print(v) }
        return EmptyView()
    }
}

struct PlayerScreen_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PlayerScreen()
        }
    }
}
