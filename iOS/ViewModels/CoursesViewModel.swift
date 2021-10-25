//
//  CoursesViewModel.swift
//  CourseAppCrehana (iOS)
//
//  Created by Nafarrate, Luis on 24/10/21.
//

import Foundation

protocol CoursesViewModelProtocol: AnyObject {
    var courses: [Course] { set get }
    var onFetchCoursesSucceed: (() -> Void)? { set get }
    var onFetchCoursesFailure: ((Error) -> Void)? { set get }
    func getCourses(completion: @escaping (_ course: [Course]?, _ error: Error?) -> ())
}

final class CoursesViewModel: CoursesViewModelProtocol {
    
    private let networkService: NetworkService
    
    init() {
        self.networkService = NetworkManager()
    }
    
    var courses: [Course] = []
    var onFetchCoursesSucceed: (() -> Void)?
    var onFetchCoursesFailure: ((Error) -> Void)?
    
    func getCourses(completion: @escaping (_ course: [Course]?, _ error: Error?) -> ()) {
        let request = CourseRequest()
        networkService.request(request) { [weak self] result in
            switch result {
            case .success(let courses):
                self?.courses = courses
                completion(courses, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
