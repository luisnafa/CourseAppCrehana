//
//  Video.swift
//  CourseAppCrehana (iOS)
//
//  Created by Nafarrate, Luis on 25/10/21.
//

import Foundation

struct Video: Hashable {
    let id: String
    let courseId: String
    let title: String
    let url: String
}

extension Video: Decodable {
    enum Keys: String, CodingKey {
        case id
        case courseId = "CourseId"
        case title
        case url
    }

    init(from decoder: Decoder) throws {
        let courseContainer = try decoder.container(keyedBy: Keys.self)
        id = try courseContainer.decode(String.self, forKey: .id)
        courseId = try courseContainer.decode(String.self, forKey: .courseId)
        title = try courseContainer.decode(String.self, forKey: .title)
        url = try courseContainer.decode(String.self, forKey: .url)
    }
}
