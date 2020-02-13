//
//  Entities.swift
//  example
//
//  Created by Alejandro  Rodriguez on 2/13/20.
//  Copyright © 2020 Alejandro Rodriguez. All rights reserved.
//

import Foundation

struct ListUserRequest: Codable {
    let page: Int
    let total: Int
    let data: [UserEntity]
}
struct UserEntity: Codable {
    let id: Int
    let email: String
    let first_name: String
    let last_name: String
    let avatar: String
    
    func fullName() -> String {
        return "\(self.first_name) \(self.last_name) "
    }
}
