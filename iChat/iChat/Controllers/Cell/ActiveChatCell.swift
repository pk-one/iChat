//
//  ActiveChatCell.swift
//  iChat
//
//  Created by Pavel Olegovich on 22.01.2022.
//

import Foundation
import UIKit

protocol SelfConfiguringCell {
    static var reuseID: String { get }
    func configure(with value: MChat)
}

class ActiveChatCell: UICollectionViewCell, SelfConfiguringCell {
    
    static var reuseID: String = "ActiveChatCell"
    private let friendImageView = UIImageView()
    private let friendNameLabel = UILabel(text: "User name", font: .laoSangamMN20())
    private let lastMessageLabel = UILabel(text: "How are you", font: .laoSangamMN18())
    private let gradientView = GradientView(from: .topTrailing, to: .bottomLeading, startColor: #colorLiteral(red: 0.8309458494, green: 0.7057176232, blue: 0.9536159635, alpha: 1), endColor: #colorLiteral(red: 0.5460671782, green: 0.7545514107, blue: 0.9380497336, alpha: 1))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .white
        self.layer.cornerRadius = 4
        self.clipsToBounds = true
        
        friendImageView.translatesAutoresizingMaskIntoConstraints = false
        friendNameLabel.translatesAutoresizingMaskIntoConstraints = false
        lastMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        gradientView.translatesAutoresizingMaskIntoConstraints = false

        
        friendImageView.backgroundColor = .systemBlue
        gradientView.backgroundColor = .black
        
        self.addSubview(friendImageView)
        self.addSubview(gradientView)
        self.addSubview(friendNameLabel)
        self.addSubview(lastMessageLabel)
    }
    
    func configure(with value: MChat) {
        friendImageView.image = UIImage(named: value.userImageString)
        friendNameLabel.text = value.username
        lastMessageLabel.text = value.lastMessage
    }
}

//MARK: - setConstraints
extension ActiveChatCell {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            friendImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            friendImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            friendImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: 0),
            friendImageView.widthAnchor.constraint(equalToConstant: 78)
        ])
        
        NSLayoutConstraint.activate([
            friendNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            friendNameLabel.leadingAnchor.constraint(equalTo: self.friendImageView.trailingAnchor, constant: 16),
            friendNameLabel.trailingAnchor.constraint(equalTo: self.gradientView.leadingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            lastMessageLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -14),
            lastMessageLabel.leadingAnchor.constraint(equalTo: self.friendImageView.trailingAnchor, constant: 16),
            lastMessageLabel.trailingAnchor.constraint(equalTo: self.gradientView.leadingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            gradientView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            gradientView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            gradientView.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: 0),
            gradientView.widthAnchor.constraint(equalToConstant: 8)
        ])
        
       
    }
}


//MARK: - SwiftUI
import SwiftUI

struct ActiveChatVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let tabbarVC = MainTabBarController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<ActiveChatVCProvider.ContainerView>) -> MainTabBarController {
            return tabbarVC
        }
        
        func updateUIViewController(_ uiViewController: ActiveChatVCProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<ActiveChatVCProvider.ContainerView>) {
            
        }
    }
}
