//
//  AppDelegate.swift
//  SpotifyApp
//
//  Created by Kaan Yalçınkaya on 5.01.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        //Apple dark mode için .systemBackground öneriyor.
        window?.backgroundColor = .spotifyBlack
        window?.makeKeyAndVisible()
        
        let navigationController = UINavigationController(rootViewController: TitleBarController())
        window?.rootViewController = navigationController
        
//        window?.rootViewController = HomeController()
        
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().barTintColor = .spotifyBlack
        
        return true
    }
    


}

