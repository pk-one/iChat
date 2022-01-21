//
//  AddPhotoView.swift
//  iChat
//
//  Created by Pavel Olegovich on 21.01.2022.
//

import Foundation
import UIKit

class AddPhotoView: UIView {
    
    private var circleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "avatar")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.borderWidth = 1
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let plusButton: UIButton = {
        let button = UIButton(type: .system)
        let myImage = UIImage(named: "plus")
        button.tintColor = .specialButtonDark
        button.setImage(myImage, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        circleImageView.layer.cornerRadius = circleImageView.frame.height / 2
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        self.addSubview(circleImageView)
        self.addSubview(plusButton)
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - setConstraints
extension AddPhotoView {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            circleImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            circleImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            circleImageView.widthAnchor.constraint(equalToConstant: 100),
            circleImageView.heightAnchor.constraint(equalToConstant: 100),
            circleImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            plusButton.leadingAnchor.constraint(equalTo: circleImageView.trailingAnchor, constant: 16),
            plusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            plusButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            plusButton.widthAnchor.constraint(equalToConstant: 30),
            plusButton.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
}
