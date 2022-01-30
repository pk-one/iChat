//
//  UIImageView + Extension.swift
//  iChat
//
//  Created by Pavel Olegovich on 19.01.2022.
//

import Foundation
import UIKit

extension UIImageView {
    convenience init(image: UIImage?, contentMode: UIView.ContentMode) {
        self.init()
        
        self.image = image
        self.contentMode = contentMode
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}


extension UIImageView {
    func setupColor(color: UIColor) {
        let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
        self.image = templateImage
        self.tintColor = color
    }
}
