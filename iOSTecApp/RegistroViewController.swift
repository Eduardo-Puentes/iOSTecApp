//
//  RegistroViewController.swift
//  iOSTecApp
//
//  Created by Alejandro Guzman on 11/11/24.
//

import UIKit
import FirebaseAuth

class RegistroViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func registerButtonTapped(_ sender: UIButton) {
        guard let email = emailTextField.text, !email.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
            print("Por favor, complete todos los campos.")
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print("Error en el registro:", error.localizedDescription)
            } else {
                print("Registro exitoso para el usuario:", authResult?.user.email ?? "")
                // Navegar o mostrar pantalla de bienvenida después del registro exitoso
                self.performSegue(withIdentifier: "irInicioSesion", sender: self)
            }
        }
    }
}

