//
//  LoginViewController.swift
//  iChat
//
//  Created by Pavel Olegovich on 20.01.2022.
//

import Foundation
import UIKit
 
class LoginViewController: UIViewController {
    
    private let welcomeLabel = UILabel(text: "Welcome back!", font: .avenir26())
    
    private let loginWithLabel = UILabel(text: "Login with")
    private let orLabel = UILabel(text: "or")
    private let emailLabel = UILabel(text: "Email")
    private let passwordLabel = UILabel(text: "Password")
    private let needAnAccountLabel = UILabel(text: "Need an account?")
    
    private let googleButton = UIButton(title: "Google", titleColor: .specialButtonDark, backgroundColor: .white, isShadow: true)
    
    private let emailTextField = OneLineTextField(font: .avenir20())
    private let passwordTextField = OneLineTextField(font: .avenir20())
    
    private let loginButton = UIButton(title: "Login", titleColor: .white, backgroundColor: .specialButtonDark)
    
    private let signInButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.titleLabel?.font = .avenir20()
        button.tintColor = .specialButtonRed
        button.contentHorizontalAlignment = .leading
        button.setTitleColor(.specialButtonRed, for: .normal)
        return button
    }()
    
    private var emailStackView = UIStackView()
    private var passwordStackView = UIStackView()
    private var stackView = UIStackView()
    private var bottomStackView = UIStackView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }
    
    
    private func setupViews() {
        view.backgroundColor = .white
        
        let loginWithView = ButtonFormView(label: loginWithLabel, button: googleButton)
        
        emailStackView = UIStackView(arrangedSubviews: [emailLabel,
                                                        emailTextField],
                                     axis: .vertical,
                                     spacing: 0)
        
        passwordStackView = UIStackView(arrangedSubviews: [passwordLabel,
                                                           passwordTextField],
                                     axis: .vertical,
                                     spacing: 0)
        
        stackView = UIStackView(arrangedSubviews: [loginWithView,
                                                   orLabel,
                                                   emailStackView,
                                                   passwordStackView,
                                                   loginButton],
                                axis: .vertical,
                                spacing: 40)
        
        bottomStackView = UIStackView(arrangedSubviews: [needAnAccountLabel,
                                                         signInButton],
                                      axis: .horizontal,
                                      spacing: 10)
         
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
extension LoginViewController {
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
            loginButton.heightAnchor.constraint(equalToConstant: 60)
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

struct LoginVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let LoginVC = LoginViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<LoginVCProvider.ContainerView>) -> LoginViewController {
            return LoginVC
        }
        
        func updateUIViewController(_ uiViewController: LoginVCProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<LoginVCProvider.ContainerView>) {
            
        }
    }
}
