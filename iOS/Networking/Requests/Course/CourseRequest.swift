//
//  CourseRequest.swift
//  CourseAppCrehana (iOS)
//
//  Created by Nafarrate, Luis on 24/10/21.
//

import Foundation

struct CourseRequest: DataRequest {
    var url: String {
        let baseURL: String = "https://61572bb98f7ea60017985113.mockapi.io/api/v1/"
        let path: String = "Course"
        return baseURL + path
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
