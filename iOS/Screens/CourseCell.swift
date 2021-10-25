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
    private let padding: CGFloat = 10
    
    var body: some View {
        GeometryReader { geometry in
            HStack {
                Image(Images.courseExampleImage)
                Spacer(minLength: 12)
                VStack(spacing: 5) {
                    Text(title).foregroundColor(.white)
                        .font(.headline)
                        .padding(.top, 10)
                        .frame(width: geometry.size.width - (padding * 2),
                               height: 40,
                               alignment: .leading)
                    
                    Text(subTitle).foregroundColor(Colors.mediumGray)
                        .font(.subheadline)
                        .frame(width: geometry.size.width - (padding * 2),
                               height: 40,
                               alignment: .topLeading)
                    
                }.frame(width: geometry.size.width - (padding * 2),
                        height: 100,
                        alignment: .topLeading)
            }
        }.frame(height:100)
    }
}

struct CourseCell_Previews: PreviewProvider {
    static var previews: some View {
        CourseCell()
            .background(Colors.darkBackground)
    }
}
