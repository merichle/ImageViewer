//
//  SceneDelegate.swift
//  CompositionalImageViewer
//
//  Created by Ramazan Karami on 2/20/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let rootViewController = MainViewController()
        let rootNavigationController = UINavigationController(rootViewController: rootViewController)
        window.rootViewController = rootNavigationController
        self.window = window
        window.makeKeyAndVisible()
    }
}
