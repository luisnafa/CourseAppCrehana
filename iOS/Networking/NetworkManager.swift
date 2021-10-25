//
//  NetworkRequest.swift
//  CourseAppCrehana (iOS)
//
//  Created by Nafarrate, Luis on 24/10/21.
//

import UIKit

struct Errors {
    static let urlError = NSError(domain: "com.crehana.networkError", code: 0, userInfo: [NSLocalizedDescriptionKey: "Network error in URL"])
    static let unsuccessfulRequest = NSError(domain: "com.crehana.networkError", code: 0, userInfo: [NSLocalizedDescriptionKey: "Network error in URL"])
    static let responseData = NSError(domain: "com.crehana.networkError", code: 0, userInfo: [NSLocalizedDescriptionKey: "Network error in URL"])
    
}

protocol NetworkService {
    func request<Request: DataRequest>(_ request: Request, completion: @escaping (Result<Request.Response, Error>) -> Void)
}

final class NetworkManager: NetworkService {
    func request<Request: DataRequest>(_ request: Request, completion: @escaping (Result<Request.Response, Error>) -> Void) {
        guard let urlComponent = URLComponents(string: request.url), let url = urlComponent.url else {
            return completion(.failure(Errors.urlError))
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                return completion(.failure(error))
            }
            
            guard let response = response as? HTTPURLResponse, 200..<300 ~= response.statusCode else {
                return completion(.failure(Errors.unsuccessfulRequest))
            }
            
            guard let data = data else {
                return completion(.failure(Errors.responseData))
            }
            
            do {
                try completion(.success(request.decode(data)))
            } catch let error as NSError {
                completion(.failure(error))
            }
        }
        .resume()
    }
    
    func downloadImage(from url: URL, completion: @escaping (UIImage?) -> ()) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else { return }
            completion(UIImage(data: data))
        }.resume()
    }
}
