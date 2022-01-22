//
//  SelfConfiguringCell.swift
//  iChat
//
//  Created by Pavel Olegovich on 22.01.2022.
//

import Foundation

protocol SelfConfiguringCell {
    static var reuseID: String { get }
    func configure<U: Hashable>(with value: U)
}
