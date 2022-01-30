//
//  OneLineTextField.swift
//  iChat
//
//  Created by Pavel Olegovich on 19.01.2022.
//

import Foundation
import UIKit

class OneLineTextField: UITextField {
    
    private var bottomView: UIView = {
        let view = UIView(frame: CGRect.init(x: 0, y: 0, width: 0, height: 1))
        view.backgroundColor = .specialTextFieldLight
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    convenience init(font: UIFont? = .avenir20()) {
        self.init()
        
        setupViews(font: font)
        setConstraints()
    }
    
    private func setupViews(font: UIFont?) {
        self.font = font
        self.borderStyle = .none
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(bottomView)
    }
}

//MARK: - setConstraints
extension OneLineTextField {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            bottomView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            bottomView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}

