//
//  EndPoints.swift
//  CourseAppCrehana (iOS)
//
//  Created by Nafarrate, Luis on 25/10/21.
//

import Foundation

let BASE_ENDPOINT = "https://61572bb98f7ea60017985113.mockapi.io/api/v1/"

class Path {
    static func course() -> String { return "Course" }
    static func video(courseId: String) -> String { return "Course/\(courseId)/Video" }
}
