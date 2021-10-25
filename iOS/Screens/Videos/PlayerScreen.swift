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
import RxSwift

struct PlayerScreen: View {
    private let padding: CGFloat = 16
    private let widthForHeader = UIScreen.main.bounds.width - (16 * 2)
    @ObservedObject private var videosViewModel = VideosViewModel()
    private let player = AVQueuePlayer()
    
    var courseId = VideosViewModel.emptyCourseId
    var title = "Title"
    var profileName = "Profile Name"
    var profileImageUrl = Images.empty_image
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                VideoPlayer(player: player)
                    .frame(width: geometry.size.width, height: 211, alignment: .top)
                
                PlayerHeader(title: title, profileName: profileName, profileImageUrl: profileImageUrl)
                
                List {
                    ForEach(videosViewModel.videos, id:\.self) { video in
                        Button (action: {
                            player.removeAllItems()
                            updateVideo(urlString: video.url)
                            player.play()
                        }) {
                            ChapterCell(title: video.title, subTitle: video.id)
                        }
                    }.onReceive(videosViewModel.$videos, perform: { videos in
                        loopAllVideos(videos)
                    }).listRowBackground(Colors.darkBackground)
                }
            }
        }.background(Colors.darkBackground).onAppear() {
            videosViewModel.getVideos(courseId: courseId)
            configureTableView()
        }.onDisappear() {
            player.removeAllItems()
        }
    }
    
    private func updateVideo(urlString: String) {
        let playerItem = AVPlayerItem.init(url: URL(string: urlString)!)
        player.insert(playerItem, after: nil)
    }
    
    private func loopAllVideos(_ videos: [Video]) {
        for video in videos {
            updateVideo(urlString: video.url)
        }
        player.play()
    }
    
    private func configureTableView() {
        UITableView.appearance().backgroundColor = UIColor(Colors.darkBackground)
        UITableViewCell.appearance().selectionStyle = .gray
        UITableView.appearance().separatorStyle = .none
    }
}

struct PlayerScreen_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PlayerScreen()
        }
    }
}
