//

import Foundation

// MARK: - Repository
struct Repository: Codable {
    let name: String
    let owner: Owner
}

// MARK: - Owner
struct Owner: Codable {
    let login: String
    let avatarURL: String

    enum CodingKeys: String, CodingKey {
        case login = "login"
        case avatarURL = "avatar_url"
    }
}

