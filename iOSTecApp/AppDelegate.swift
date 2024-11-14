//
//  AppDelegate.swift
//  iOSTecApp
//
//  Created by base on 22/08/24.
//

import UIKit
import FirebaseCore  // Asegúrate de tener esta importación

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Configuración de Firebase
        FirebaseApp.configure()  // Asegúrate de tener esta línea aquí
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Manejo de sesiones descartadas
    }
}

