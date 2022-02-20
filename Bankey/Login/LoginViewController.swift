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
    
    //animation
    var centeringEdgeOnScreen: CGFloat = 0
    var centeringEdgeOffScreen: CGFloat = -1000
    
    var titleCenteringAnchor: NSLayoutConstraint?
    var animationViewCenteringAnchor: NSLayoutConstraint?

    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        signInButton.configuration?.showsActivityIndicator = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animate()
    }
}

extension LoginViewController {
    private func style() {
        
        applicationLabel.translatesAutoresizingMaskIntoConstraints = false
        applicationLabel.text = "Bankey"
        applicationLabel.textColor = .black
        applicationLabel.font = UIFont.boldSystemFont(ofSize: 30)
        applicationLabel.alpha = 0
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        let animation = Animation.named("bear", animationCache: LRUAnimationCache.sharedCache)
        animationView.frame = self.view.bounds
        animationView.alpha = 0
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
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
//        NSLayoutConstraint.activate([
//            applicationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            applicationLabel.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 5)
//        ])
        
        applicationLabel.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 5).isActive = true
        titleCenteringAnchor = applicationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: centeringEdgeOffScreen)
        titleCenteringAnchor?.isActive = true
        
        // AnimationView
        NSLayoutConstraint.activate([
            animationView.topAnchor.constraint(equalToSystemSpacingBelow: applicationLabel.bottomAnchor, multiplier: 1),
            animationView.bottomAnchor.constraint(equalTo: loginView.topAnchor),
            animationView.widthAnchor.constraint(equalToConstant: 200),
            animationView.heightAnchor.constraint(equalToConstant: 200)
        ])
        animationViewCenteringAnchor = animationView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: centeringEdgeOffScreen)
        animationViewCenteringAnchor?.isActive = true
        

//
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

// MARK: - Animations
extension LoginViewController {
    private func animate() {
        let animator1 = UIViewPropertyAnimator(duration: 2.0, curve: .easeOut, animations: {
            self.titleCenteringAnchor?.constant = self.centeringEdgeOnScreen
            self.view.layoutIfNeeded()
        })
        animator1.startAnimation()
        
        let animator2 = UIViewPropertyAnimator(duration: 2.0, curve: .easeOut, animations: {
            self.animationViewCenteringAnchor?.constant = self.centeringEdgeOnScreen
            self.view.layoutIfNeeded()

        })
        animator2.startAnimation(afterDelay: 1)
        
        let animator3 = UIViewPropertyAnimator(duration: 4.0, curve: .easeOut, animations: {
            self.applicationLabel.alpha = 1.0
            self.animationView.alpha = 1.0
            self.view.layoutIfNeeded()
        })
        animator3.startAnimation()
        // applicationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        // applicationLabel.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 5)
    }
}

