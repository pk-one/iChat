//
//  WaitingChatCell.swift
//  iChat
//
//  Created by Pavel Olegovich on 22.01.2022.
//

import Foundation
import UIKit

class WaitingChatCell: UICollectionViewCell, SelfConfiguringCell {

    static var reuseID: String = "WaitingChatCell"
    
    private let friendImageView = UIImageView()
    
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
        self.addSubview(friendImageView)
    }
    
    func configure<U>(with value: U) where U : Hashable {
        guard let waitingChats: MChat = value as? MChat else { return }
        friendImageView.image = UIImage(named: waitingChats.userImageString)
    }
}

//MARK: - setConstraints
extension WaitingChatCell {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            friendImageView.topAnchor.constraint(equalTo: self.topAnchor),
            friendImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            friendImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            friendImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}


//MARK: - SwiftUI
import SwiftUI

struct WaitingChatVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let tabbarVC = MainTabBarController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<WaitingChatVCProvider.ContainerView>) -> MainTabBarController {
            return tabbarVC
        }
        
        func updateUIViewController(_ uiViewController: WaitingChatVCProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<WaitingChatVCProvider.ContainerView>) {
            
        }
    }
}
