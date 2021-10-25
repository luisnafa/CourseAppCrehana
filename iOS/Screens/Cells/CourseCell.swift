//
//  CourseCell.swift
//  CourseAppCrehana (iOS)
//
//  Created by Nafarrate, Luis on 24/10/21.
//

import SwiftUI

struct CourseCell: View {
    var title: String = "Title"
    var subTitle: String = "Subtitle"
    var imageUrl: String = Images.empty_image
    private let padding: CGFloat = 40
    @ObservedObject private var imageViewModel = ImageViewModel()

    var body: some View {
        GeometryReader { geometry in
            HStack {
                imageViewModel.image
                    .resizable()
                    .frame(width: 90, height: 90)
                
                Spacer(minLength: 12)
                
                VStack(spacing: 5) {
                    Text(title).foregroundColor(.white)
                        .lineLimit(2)
                        .font(.headline)
                        .padding(.top, 10)
                        .frame(width: geometry.size.width - (padding * 2),
                               alignment: .leading)

                    Text(subTitle).foregroundColor(Colors.transparentGray)
                        .font(.caption)
                        .frame(width: geometry.size.width - (padding * 2),
                               height: 40,
                               alignment: .topLeading)

                }.frame(width: geometry.size.width - (padding * 2),
                        height: 100,
                        alignment: .topLeading)
            }
        }.frame(height:100).onAppear { imageViewModel.getImage(url: imageUrl) }
    }
}

struct CourseCell_Previews: PreviewProvider {
    static var previews: some View {
        CourseCell()
            .background(Colors.darkBackground)
    }
}
