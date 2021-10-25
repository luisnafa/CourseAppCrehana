//
//  VideosViewModel.swift
//  CourseAppCrehana (iOS)
//
//  Created by Nafarrate, Luis on 25/10/21.
//

import Foundation

protocol VideosViewModelProtocol: ObservableObject {
    var videos: [Video] { set get }
    func getVideos(courseId: String)
}

final class VideosViewModel: VideosViewModelProtocol {
    private let networkService = NetworkManager()
    static let defaultVideo = "https://crehana-videos.akamaized.net/outputs/trailer/89ef7d652e4549709347f89aa7be0f57/1f68b3fffd1641c0b03d1457a53808d4.m3u8"
    static let emptyCourseId = "0"
    
    @Published var videos: [Video] = []
    @Published var firstVideoUrl: String = VideosViewModel.defaultVideo
    
    func getVideos(courseId: String) {
        guard courseId != VideosViewModel.emptyCourseId else { return }
        let request = VideoRequest(courseId: courseId)
        networkService.request(request) { result in
            switch result {
            case .success(let videos):
                DispatchQueue.main.async { [weak self] in
                    self?.videos = videos
                    self?.firstVideoUrl = videos.first?.url ?? VideosViewModel.defaultVideo
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
