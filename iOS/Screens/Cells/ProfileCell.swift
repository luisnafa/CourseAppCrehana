//
//  ProfileCell.swift
//  CourseAppCrehana (iOS)
//
//  Created by Nafarrate, Luis on 25/10/21.
//

import SwiftUI

struct ProfileCell: View {
    var name: String = ""
    var profileImageUrl: String = Images.empty_image
    
    @ObservedObject private var imageViewModel = ImageViewModel()
    
    var body: some View {
        HStack {
            imageViewModel.image
                .resizable()
                .frame(width: 24, height: 24)
            
            Text(name).foregroundColor(.white).listRowBackground(Colors.darkBackground)
            
        }.onAppear { imageViewModel.getImage(url: profileImageUrl) }
    }
}
