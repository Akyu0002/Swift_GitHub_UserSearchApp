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
