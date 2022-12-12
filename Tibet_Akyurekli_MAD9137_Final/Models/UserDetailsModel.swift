//
//  UserDetailsModel.swift
//  Tibet_Akyurekli_MAD9137_Final
//
//  Created by Tibet Akyurekli on 2022-12-08.
//

import Foundation

//MARK: User Detail Model
struct UserDetail: Identifiable, Codable {
    let id: Int
    let userUrl: String
    let avatarUrl: String
    let type: String
    let name: String?
    let username: String?
    let company: String?
    let location: String?
    let email: String?
    let bio: String?
    let followers: Int
    let publicRepos: Int
    let publicGists: Int
    let createdAt: String
    let updatedAt: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case userUrl = "html_url"
        case avatarUrl = "avatar_url"
        case type
        case name
        case username = "login"
        case company
        case location
        case email
        case bio
        case followers
        case publicRepos = "public_repos"
        case publicGists = "public_gists"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
