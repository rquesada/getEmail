//
//  HttpClient.swift
//  TestApp
//
//  Created by Roy Quesada on 28/3/23.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case noData
    case decodingError
}

class HttpClient {
    static let shared = HttpClient()
    
    func getUsers(completion: @escaping(Result<[User]?,NetworkError>)-> Void){
        guard let url = URL.forResults() else {
            return completion(.failure(.badURL))
        }
        
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else {
                return completion(.failure(.noData))
            }
            
            guard let userResults = try? JSONDecoder().decode(UserResponse.self, from: data) else {
                return completion(.failure(.decodingError))
            }
            print("userResults =\(userResults)")
            completion(.success(userResults.users))
        }.resume()
    }
}
