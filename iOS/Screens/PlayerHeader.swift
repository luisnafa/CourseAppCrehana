//
//  PlayerHeader.swift
//  CourseAppCrehana
//
//  Created by Nafarrate, Luis on 24/10/21.
//

import SwiftUI

struct ProfileCell: View {
    var name: String = ""
    var body: some View {
        HStack {
            Image(Images.profileThumbnail)
            Text(name).foregroundColor(.white).listRowBackground(Colors.darkBackground)
        }
    }
}

struct PlayerHeader: View {
    let padding: CGFloat = 16
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack {
                    Text("Maquetación de sitios web dinámicos con Javascript y...")
                        .font(.title2).bold().foregroundColor(.white)
                        .frame(alignment: .leading)
                    
                    VStack {
                        Button("...") {
                            print("Clicked on ... button")
                        }.foregroundColor(.white).font(.title)
                    }.frame(width: 50, height: 70, alignment: .topTrailing)
                }.frame(width: geometry.size.width - (padding * 2), height: 70)
                
                ProfileCell(name: "Luis Gadea")
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
