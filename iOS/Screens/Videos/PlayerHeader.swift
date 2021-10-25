//
//  PlayerHeader.swift
//  CourseAppCrehana
//
//  Created by Nafarrate, Luis on 24/10/21.
//

import SwiftUI

struct PlayerHeader: View {
    private let padding: CGFloat = 16
    
    var title: String = "Title"
    var profileName: String = "Profile Name"
    var profileImageUrl: String = Images.empty_image
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack {
                    Text(title)
                        .font(.title2).bold().foregroundColor(.white)
                        .frame(alignment: .leading)
                    
                    Spacer()
                    
                    VStack {
                        Button("...") {
                            print("Clicked on ... button")
                        }.foregroundColor(.white).font(.title)
                    }.frame(width: 50, height: 70, alignment: .topTrailing)
                }.frame(width: geometry.size.width - (padding * 2), height: 70, alignment: .leading)
                
                ProfileCell(name: profileName, profileImageUrl: profileImageUrl)
                    .frame(width: geometry.size.width - (padding * 2), height: 25, alignment: .leading)
                
                Rectangle()
                    .frame(height: 2, alignment: .bottom)
                    .foregroundColor(Colors.lightGray)
                    .frame(width: geometry.size.width)
                
            }.frame(width: geometry.size.width - (padding * 2), alignment: .leading)
            
        }.frame(height: 130)
    }
}

struct PlayerHeader_Previews: PreviewProvider {
    static var previews: some View {
        PlayerHeader()
            .background(Colors.darkBackground)
    }
}
