//
//  SetupProfileViewController.swift
//  iChat
//
//  Created by Pavel Olegovich on 21.01.2022.
//

import Foundation
import UIKit

class SetupProfileViewController: UIViewController {
    
    private let welcomeLabel = UILabel(text: "Set up profile!", font: .avenir26())
    
    private let fullNameLabel = UILabel(text: "Full name")
    private let aboutMeLabel = UILabel(text: "About me")
    private let sexLabel = UILabel(text: "Sex")
    
    private let fullNameTextField = OneLineTextField(font: .avenir20())
    private let aboutMeTextField = OneLineTextField(font: .avenir20())
    private let segmentedControl = UISegmentedControl(first: "Male", second: "Female")
    
    private let goToChatsButton = UIButton(title: "Go to chats",
                                           titleColor: .white,
                                           backgroundColor: .specialButtonDark,
                                           cornerRadius: 4)
    
    private  let fullImageView = AddPhotoView()
    
    private var fullNameStackView = UIStackView()
    private var aboutMeStackView = UIStackView()
    private var sexStackView = UIStackView()
    private var stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(fullImageView)
        
        fullNameStackView = UIStackView(arrangedSubviews: [fullNameLabel,
                                                           fullNameTextField],
                                        axis: .vertical,
                                        spacing: 0)
        
        aboutMeStackView = UIStackView(arrangedSubviews: [aboutMeLabel,
                                                          aboutMeTextField],
                                       axis: .vertical,
                                       spacing: 0)
        
        
        sexStackView = UIStackView(arrangedSubviews: [sexLabel,
                                                      segmentedControl],
                                   axis: .vertical,
                                   spacing: 12)
        
        stackView = UIStackView(arrangedSubviews: [fullNameStackView,
                                                   aboutMeStackView,
                                                   sexStackView,
                                                   goToChatsButton],
                                axis: .vertical,
                                spacing: 40)
        view.addSubview(welcomeLabel)
        view.addSubview(fullImageView)
        view.addSubview(stackView)
        
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        fullImageView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
}


//MARK: - setConstraints
extension SetupProfileViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            fullImageView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 40),
            fullImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: fullImageView.bottomAnchor, constant: 40),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
        ])
        
        
         
        NSLayoutConstraint.activate([
            goToChatsButton.heightAnchor.constraint(equalToConstant: 60)
        ])
        
    }
}








//MARK: - SwiftUI
import SwiftUI

struct SetupProfileVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let setupProfileVC = SetupProfileViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<SetupProfileVCProvider.ContainerView>) -> SetupProfileViewController {
            return setupProfileVC
        }
        
        func updateUIViewController(_ uiViewController: SetupProfileVCProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<SetupProfileVCProvider.ContainerView>) {
            
        }
    }
}
