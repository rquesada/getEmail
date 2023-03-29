//
//  Results.swift
//  TestApp
//
//  Created by Roy Quesada on 28/3/23.
//

import Foundation


struct UserResponse : Decodable {
    let users:[User]
    
    private enum CodingKeys: String, CodingKey {
        case users = "results"
    }
}

struct User: Decodable {
    let email: String
}
