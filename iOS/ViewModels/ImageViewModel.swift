//
//  ImageViewModel.swift
//  CourseAppCrehana (iOS)
//
//  Created by Nafarrate, Luis on 24/10/21.
//

import SwiftUI

protocol ImageViewModelProtocol: ObservableObject {
    var image: Image { set get }
    func getImage(url: String)
}

final class ImageViewModel: ImageViewModelProtocol {
    private let networkService = NetworkManager()
    
    @Published var image = Image(Images.empty_image)
    
    func getImage(url: String) {
        networkService.downloadImage(from: URL(string: url)!) { image in
            if let image = image {
                DispatchQueue.main.async { [weak self] in
                    self?.image = Image(uiImage: image)
                }
            } else {
                print(NSError())
            }
        }
    }
}
