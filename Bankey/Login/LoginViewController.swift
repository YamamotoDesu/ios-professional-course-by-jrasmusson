//
//  ViewController.swift
//  Bankey
//
//  Created by 山本響 on 2022/01/10.
//

import UIKit
import Lottie

protocol LoginViewControllerDlegate: AnyObject {
    func didLogin()
}

protocol LogoutDlegate: AnyObject {
    func didLogout()
}

class LoginViewController: UIViewController {
    
    let applicationLabel = UILabel()
    let animationView = AnimationView()
    let loginView = LoginView()
    let signInButton = UIButton(type: .system)
    let errorMessageLabel = UILabel()
    
    weak var delegate: LoginViewControllerDlegate?
    
    var userName: String? {
        return loginView.usernameTextField.text
    }
    
    var password: String? {
        return loginView.passwordTextField.text
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        signInButton.configuration?.showsActivityIndicator = false
    }
}

extension LoginViewController {
    private func style() {
        
        applicationLabel.translatesAutoresizingMaskIntoConstraints = false
        applicationLabel.text = "Bankey"
        applicationLabel.textColor = .black
        applicationLabel.font = UIFont.boldSystemFont(ofSize: 30)
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        let animation = Animation.named("bear", animationCache: LRUAnimationCache.sharedCache)
        animationView.frame = self.view.bounds
        animationView.animation = animation
        animationView.loopMode = .loop
        animationView.play()
        
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8 // for Indicator spacing
        signInButton.setTitle("Sign In", for: [])
        signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.numberOfLines = 0
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.text = "Error faulure"
        errorMessageLabel.isHidden = true

    }
    
    private func layout() {
        view.addSubview(applicationLabel)
        view.addSubview(animationView)
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        
        // ApplicationLabel
        NSLayoutConstraint.activate([
            applicationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            applicationLabel.topAnchor.constraint(greaterThanOrEqualToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 5),
            applicationLabel.bottomAnchor.constraint(equalToSystemSpacingBelow: animationView.topAnchor, multiplier: 3)
        ])
        
        // AnimationView
        NSLayoutConstraint.activate([
            animationView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            animationView.bottomAnchor.constraint(equalToSystemSpacingBelow: loginView.topAnchor, multiplier: 3),
            animationView.widthAnchor.constraint(equalToConstant: 300),
            animationView.heightAnchor.constraint(equalToConstant: 300)
        ])
        
        // LoginView
        NSLayoutConstraint.activate([
            loginView.heightAnchor.constraint(equalToConstant: 80),
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 4),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 4)
        ])
        
        // Button
        NSLayoutConstraint.activate([
            signInButton.heightAnchor.constraint(equalToConstant: 50),
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 5),
            signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInButton.widthAnchor.constraint(equalTo: loginView.widthAnchor, multiplier: 1)
        ])
        
        // ErrorLabel
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            errorMessageLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
        
    }
}

// MARK: Actions
extension LoginViewController {
    @objc func signInTapped(sender: UIButton) {
        errorMessageLabel.isHidden = true
        login()
    }
    
    private func login() {
        guard let userName = userName, let password = password else {
            assertionFailure("Username / password should never be nil")
            return
        }
        
        if userName.isEmpty || password.isEmpty {
            configureView(withMessage: "Username / password cannot be blank")
            return
        }
        
        if userName == "Yama" && password == "Yama" {
            signInButton.configuration?.showsActivityIndicator = true
            delegate?.didLogin()
        } else {
            configureView(withMessage: "Incorrect username / password")
        }
    }
    
    private func configureView(withMessage message: String) {
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
    }
}


