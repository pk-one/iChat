//
//  UserCell.swift
//  iChat
//
//  Created by Pavel Olegovich on 22.01.2022.
//

import Foundation
import UIKit

class UserCell: UICollectionViewCell, SelfConfiguringCell {

    static var reuseID: String = "UserCell"
    
    private let userImageView = UIImageView()
    private let userName = UILabel(text: "text", font: .laoSangamMN20())
    private let containerView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setConstraints()
        setupShadowOnView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.containerView.layer.cornerRadius = 4
        self.containerView.clipsToBounds = true
    }
    
    private func setupViews() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 4
      
        userImageView.translatesAutoresizingMaskIntoConstraints = false
        userName.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(containerView)
        containerView.addSubview(userImageView)
        containerView.addSubview(userName)
    }
    
    private func setupShadowOnView() {
        self.layer.shadowColor = #colorLiteral(red: 0.787740171, green: 0.787740171, blue: 0.787740171, alpha: 1)
        self.layer.shadowRadius = 3
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0, height: 4)
    }
    
    func configure<U>(with value: U) where U : Hashable {
        guard let user: MUser = value as? MUser else { return }
        userImageView.image = UIImage(named: user.avatarStringURL)
        userName.text = user.username
    }
}


//MARK: - setConstraints
extension UserCell {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            userImageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            userImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            userImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            userImageView.heightAnchor.constraint(equalTo: userImageView.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            userName.topAnchor.constraint(equalTo: userImageView.bottomAnchor),
            userName.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            userName.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            userName.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8)
        ])
    }
}


//MARK: - SwiftUI
import SwiftUI

struct UserVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let tabbarVC = MainTabBarController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<UserVCProvider.ContainerView>) -> MainTabBarController {
            return tabbarVC
        }
        
        func updateUIViewController(_ uiViewController: UserVCProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<UserVCProvider.ContainerView>) {
            
        }
    }
}
