//
//  CoursesViewModel.swift
//  CourseAppCrehana (iOS)
//
//  Created by Nafarrate, Luis on 24/10/21.
//

import Foundation

protocol CoursesViewModelProtocol: ObservableObject {
    var courses: [Course] { set get }
    func getCourses()
}

final class CoursesViewModel: CoursesViewModelProtocol {
    private let networkService = NetworkManager()
    
    @Published var courses: [Course] = []
    
    func getCourses() {
        let request = CourseRequest()
        networkService.request(request) { result in
            switch result {
            case .success(let courses):
                DispatchQueue.main.async { [weak self] in
                    self?.courses = courses
                }
            case .failure(let error):
                DispatchQueue.main.async { [weak self] in
                    self?.courses = []
                    print(error.localizedDescription.description)
                }
            }
        }
    }
}
