//
//  VideoRequest.swift
//  CourseAppCrehana (iOS)
//
//  Created by Nafarrate, Luis on 25/10/21.
//

import Foundation

struct VideoRequest: DataRequest {
    var courseId = "0"
    
    var url: String {
        return BASE_ENDPOINT + Path.video(courseId: courseId)
    }
    
    var method: HTTPMethod {
        .get
    }
    
    func decode(_ data: Data) throws -> [Video] {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let response = try decoder.decode([Video].self, from: data)
        return response
    }
}
