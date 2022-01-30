//
//  MChat.swift
//  iChat
//
//  Created by Pavel Olegovich on 22.01.2022.
//

import Foundation

struct MChat: Hashable, Codable {
    var username: String
    var userImageString: String
    var lastMessage: String
    var id: Int

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: MChat, rhs: MChat) -> Bool {
        return lhs.id == rhs.id
    }
}
