//
//  UserModel.swift
//  Tibet_Akyurekli_MAD9137_Final
//
//  Created by Tibet Akyurekli on 2022-11-30.
//

import Foundation

//MARK: User Model
struct User: Identifiable, Codable {
    let id: Int
    let username: String
    let type: String
    let avatarUrl: String
    let userUrl: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case username = "login"
        case type
        case avatarUrl = "avatar_url"
        case userUrl = "url"
        
    }
}

// Array of Test Users
let testUsers = [
    User(id: 69420, username: "Son", type: "User",
         avatarUrl: "https://avatars.githubusercontent.com/u/88984176?s=96&v=4", userUrl: " "),
]

//// Single Test User
let testUser = User(id: 69420, username: "TibetA", type: "User",
                    avatarUrl: "https://avatars.githubusercontent.com/u/90468197?v=4", userUrl: "oqhfo")

