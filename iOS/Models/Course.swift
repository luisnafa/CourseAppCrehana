//
//  Course.swift
//  CourseAppCrehana (iOS)
//
//  Created by Nafarrate, Luis on 24/10/21.
//

import Foundation

struct Course {
    let id: String
    let title: String
    let promoImage: String
    let professorFullName: String
    let professorImageUrl: String
}

extension Course: Decodable {
    enum Keys: String, CodingKey {
        case id
        case title
        case promoImage
        case professorFullName
        case professorImageUrl
    }

    init(from decoder: Decoder) throws {
        let courseContainer = try decoder.container(keyedBy: Keys.self)
        id = try courseContainer.decode(String.self, forKey: .id)
        title = try courseContainer.decode(String.self, forKey: .title)
        promoImage = try courseContainer.decode(String.self, forKey: .promoImage)
        professorFullName = try courseContainer.decode(String.self, forKey: .professorFullName)
        professorImageUrl = try courseContainer.decode(String.self, forKey: .professorImageUrl)
    }
}
