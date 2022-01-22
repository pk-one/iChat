//
//  MUser.swift
//  iChat
//
//  Created by Pavel Olegovich on 22.01.2022.
//

import Foundation

struct MUser: Hashable, Codable {
    var username: String
    var avatarStringURL: String
    var id: Int

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: MUser, rhs: MUser) -> Bool {
        return lhs.id == rhs.id
    }
}
