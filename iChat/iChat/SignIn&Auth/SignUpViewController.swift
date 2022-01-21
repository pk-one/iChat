//
//  SignUpViewController.swift
//  iChat
//
//  Created by Pavel Olegovich on 19.01.2022.
//

import Foundation
import UIKit

class SignUpViewController: UIViewController {
    
    private let welcomeLabel = UILabel(text: "Good to see you!", font: .avenir26())
    
    private let emailLabel = UILabel(text: "Email")
    private let passwordLabel = UILabel(text: "Password")
    private let confirmPasswordLabel = UILabel(text: "Confirm password")
    private let alreadyOnboardLabel = UILabel(text: "Already Onboard? ")
    
    private let emailTextField = OneLineTextField(font: .avenir20())
    private let passwordTextField = OneLineTextField(font: .avenir20())
    private let confirmPasswordTextField = OneLineTextField(font: .avenir20())
    
    private let signUpButton = UIButton(title: "Sign Up",
                                        titleColor: .white,
                                        backgroundColor: .specialButtonDark,
                                        cornerRadius: 4)
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = .avenir20()
        button.tintColor = .specialButtonRed
        button.contentHorizontalAlignment = .leading
        button.setTitleColor(.specialButtonRed, for: .normal)
        return button
    }()
    
    
    private var emailStackView = UIStackView()
    private var passwordStackView = UIStackView()
    private var confirmPasswordStackView = UIStackView()
    private var stackView = UIStackView()
    private var bottomStackView = UIStackView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }
    

    private func setupViews() {
        view.backgroundColor = .white
        
        emailStackView = UIStackView(arrangedSubviews: [emailLabel,
                                                        emailTextField],
                                     axis: .vertical,
                                     spacing: 0)
        
        passwordStackView = UIStackView(arrangedSubviews: [passwordLabel,
                                                        passwordTextField],
                                     axis: .vertical,
                                     spacing: 0)
        
        confirmPasswordStackView = UIStackView(arrangedSubviews: [confirmPasswordLabel,
                                                        confirmPasswordTextField],
                                     axis: .vertical,
                                     spacing: 0)
                
        stackView = UIStackView(arrangedSubviews: [emailStackView,
                                                   passwordStackView,
                                                   confirmPasswordStackView,
                                                  signUpButton],
                                axis: .vertical,
                                spacing: 40)
        
        bottomStackView = UIStackView(arrangedSubviews: [alreadyOnboardLabel,
                                                        loginButton],
                                      axis: .horizontal,
                                      spacing: 0)
        bottomStackView.alignment = .firstBaseline
        
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(welcomeLabel)
        view.addSubview(stackView)
        view.addSubview(bottomStackView)
    }
}

//MARK: - setConstraints
extension SignUpViewController {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 100),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
        ])
        
        NSLayoutConstraint.activate([
            signUpButton.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
            bottomStackView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 60),
            bottomStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            bottomStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
        ])
    }
}

//MARK: - SwiftUI
import SwiftUI

struct SignUpVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let signUpVC = SignUpViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<SignUpVCProvider.ContainerView>) -> SignUpViewController {
            return signUpVC
        }
        
        func updateUIViewController(_ uiViewController: SignUpVCProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<SignUpVCProvider.ContainerView>) {
            
        }
    }
}
