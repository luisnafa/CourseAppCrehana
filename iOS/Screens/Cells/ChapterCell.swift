//
//  ChapterCell.swift
//  CourseAppCrehana (iOS)
//
//  Created by Nafarrate, Luis on 24/10/21.
//

import SwiftUI

struct ChapterCell: View {
    var title: String = "Title"
    var subTitle: String = "Subtitle"
    private let padding: CGFloat = 16

    var body: some View {
        GeometryReader { geometry in
            HStack {
                VStack(spacing: -1) {
                    Image(Images.greenCircle)
                    Image(Images.greenRectangle)
                }
                Spacer(minLength: 30)
                VStack(spacing: 5) {
                    Text(title).foregroundColor(.white)
                        .frame(width: abs(geometry.size.width - (padding * 2)),
                               height: 15,
                               alignment: .topLeading).font(.headline)

                    Text("\(subTitle) m")
                        .foregroundColor(Colors.mediumGray)
                        .font(.subheadline)
                        .frame(width: abs(geometry.size.width - (padding * 2)),
                               height: 15,
                               alignment: .topLeading)

                }.frame(width: abs(geometry.size.width - (padding * 2)),
                        height: 50,
                        alignment: .topLeading)
            }
        }.frame(height:35)
    }
}
