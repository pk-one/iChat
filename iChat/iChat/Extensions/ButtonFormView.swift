//
//  ButtonFormView.swift
//  iChat
//
//  Created by Pavel Olegovich on 19.01.2022.
//

import Foundation
import UIKit

class ButtonFormView: UIView {
    
    init(label: UILabel, button: UIButton) {
        super.init(frame: .zero)
        setupViews(label: label, button: button)
        setConstraints(label: label, button: button)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews(label: UILabel, button: UIButton) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        label.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        
        self.addSubview(label)
        self.addSubview(button)
    }
}

//MARK: - setConstraints
extension ButtonFormView {
    private func setConstraints(label: UILabel, button: UIButton) {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            button.heightAnchor.constraint(equalToConstant: 60),
        ])
        
        NSLayoutConstraint.activate([
            bottomAnchor.constraint(equalTo: button.bottomAnchor)
        ])
    }
}
