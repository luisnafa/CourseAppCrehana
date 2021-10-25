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

struct PlayerScreen: View {
    private let padding: CGFloat = 16
    private let widthForHeader = UIScreen.main.bounds.width - (16 * 2)
    @ObservedObject private var videosViewModel = VideosViewModel()
    
    var courseId = VideosViewModel.emptyCourseId
    var title = "Title"
    var profileName = "Profile Name"
    var profileImageUrl = Images.empty_image
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                VideoPlayer(player: AVPlayer(url: URL(string: videosViewModel.firstVideoUrl)!))
                    .frame(width: geometry.size.width, height: 211)
                
                PlayerHeader(title: title, profileName: profileName, profileImageUrl: profileImageUrl)
                
                List {
                    ForEach(videosViewModel.videos, id:\.self) { video in
                        ChapterCell(title: video.title, subTitle: video.id)
                    }.listRowBackground(Colors.darkBackground)
                }
            }
        }.background(Colors.darkBackground).onAppear(){
            videosViewModel.getVideos(courseId: courseId)
            UITableView.appearance().backgroundColor = UIColor(Colors.darkBackground)
            UITableViewCell.appearance().selectionStyle = .none
            UITableView.appearance().separatorStyle = .none
        }
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
