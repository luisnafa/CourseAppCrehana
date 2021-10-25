//
//  CourseRequest.swift
//  CourseAppCrehana (iOS)
//
//  Created by Nafarrate, Luis on 24/10/21.
//

import Foundation

struct CourseRequest: DataRequest {
    var url: String {
        return BASE_ENDPOINT + Path.course()
    }
    
    var method: HTTPMethod {
        .get
    }
    
    func decode(_ data: Data) throws -> [Course] {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let response = try decoder.decode([Course].self, from: data)
        return response
    }
}
