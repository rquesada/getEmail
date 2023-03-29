//
//  URL+Extensions.swift
//  TestApp
//
//  Created by Roy Quesada on 28/3/23.
//

import Foundation

extension URL{
    static func forResults()-> URL?{
        //ToDo: Create number like parameter
        return URL(string: "https://randomuser.me/api/?results=10")
    }
    
}
