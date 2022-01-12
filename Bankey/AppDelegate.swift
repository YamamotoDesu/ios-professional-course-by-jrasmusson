//
//  AppDelegate.swift
//  Bankey
//
//  Created by 山本響 on 2022/01/10.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        // window?.rootViewController = LoginViewController()
        window?.rootViewController = OnboardingContainerViewController()
//        window?.rootViewController = OnboardingViewController(heroImageName: "delorean", titleText: "Bankey is faster, easier to use, and has a brand new look and feel that will make you feel like you are back in 1989.")
        
        return true
    }

}

