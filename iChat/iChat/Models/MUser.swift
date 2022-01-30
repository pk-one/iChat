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
    
    func contains(filter: String?) -> Bool {
        guard let filter = filter else { return true }
        if filter.isEmpty { return true }
        let lowercasedFilter = filter.lowercased()
        return username.lowercased().contains(lowercasedFilter)
    }
}
