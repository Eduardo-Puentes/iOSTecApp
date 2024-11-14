//
//  ViewController.swift
//  iOSGreenMatesColab
//
//  Created by base on 04/09/24.
//

import UIKit
import FirebaseAuth
import Foundation

struct User: Codable {
    let fbid: String
    let username: String
    let email: String
    // Add other fields as per your database schema
}

// Extensión para UIColor para convertir colores hexadecimales
extension UIColor {
    convenience init(hex: String) {
        var hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if hexString.hasPrefix("#") {
            hexString.remove(at: hexString.startIndex)
        }
        
        if hexString.count != 6 {
            self.init(white: 0.5, alpha: 1.0) // Valor predeterminado si el formato es incorrecto
            return
        }
        
        var rgbValue: UInt64 = 0
        Scanner(string: hexString).scanHexInt64(&rgbValue)
        
        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}

// ViewController con el botón de gradiente y el botón sin gradiente
class ViewController: UIViewController {

    
    @IBOutlet weak var roundedButton: UIButton! // Nuevo botón sin gradiente
    
    @IBOutlet weak var emailTextField: UITextField! // Campo de correo
    @IBOutlet weak var passwordTextField: UITextField! // Campo de contraseña
    @IBOutlet weak var loginButton: UIButton! // Botón de iniciar sesión

    var loggedInUser: User?
    var gradientLayer: CAGradientLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configura el botón de inicio de sesión para que esté desactivado por defecto
        loginButton.isEnabled = false
        
        // Observa los cambios en los campos de texto para activar el botón cuando haya texto en ambos
        emailTextField.addTarget(self, action: #selector(textFieldsDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldsDidChange), for: .editingChanged)
        
        // Configuración del botón con gradiente
        loginButton.backgroundColor = .clear
        loginButton.layer.masksToBounds = true
        
        // Inicializar el gradiente
        gradientLayer = CAGradientLayer()
        
        // Usar colores en hexadecimal
        let color1 = UIColor(hex: "#FFEA05") // Color hexadecimal
        let color2 = UIColor(hex: "#5AC86E") // Otro color hexadecimal
        
        gradientLayer.colors = [color1.cgColor, color2.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        
        // Añadir el gradiente al botón
        loginButton.layer.insertSublayer(gradientLayer, at: 0)
        
        // Configuración del segundo botón sin gradiente pero con bordes redondeados
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // Asegurarse de que los botones no sean nil
        if let loginButton = loginButton, let roundedButton = roundedButton {
            // Ajustar el tamaño del gradiente al botón
            gradientLayer.frame = loginButton.bounds

            // Recalcular el corner radius en caso de que el tamaño de los botones cambie
            loginButton.layer.cornerRadius = loginButton.bounds.height / 2
            loginButton.layer.cornerRadius = roundedButton.bounds.height / 2
        }
    }
    
    
    @objc func textFieldsDidChange() {
           let emailIsEmpty = emailTextField.text?.isEmpty ?? true
           let passwordIsEmpty = passwordTextField.text?.isEmpty ?? true
           loginButton.isEnabled = !emailIsEmpty && !passwordIsEmpty
       }
    
    func fetchUserData(fbID: String, completion: @escaping (User?) -> Void) {
        guard let url = URL(string: "http://10.50.90.159:3000/api/user/\(fbID)") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("Error fetching user data: \(error?.localizedDescription ?? "No error description")")
                completion(nil)
                return
            }
            
            do {
                let user = try JSONDecoder().decode(User.self, from: data)
                completion(user)
            } catch {
                print("Failed to decode user data: \(error.localizedDescription)")
                completion(nil)
            }
        }
        task.resume()
    }
    
    // Acción para el botón de iniciar sesión
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        guard let email = emailTextField.text, let password = passwordTextField.text else {
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            DispatchQueue.main.async {
                if let error = error {
                    print("Error al iniciar sesión: \(error.localizedDescription)")
                } else if let fbID = Auth.auth().currentUser?.uid {
                    // Fetch user data from your external database using Firebase UID
                    self?.fetchUserData(fbID: fbID) { user in
                        if let user = user {
                            // Guardar los datos del usuario en loggedInUser
                            self?.loggedInUser = user
                            
                            // Realizar el segue o actualizar la UI
                            DispatchQueue.main.async {
                                self?.performSegue(withIdentifier: "irMapa", sender: self)
                            }
                        } else {
                            print("Failed to fetch user data.")
                        }
                    }
                }
            }
        }
    }



    @IBAction func goToRegistro(_ sender: UIButton) {
        // Realizar el segue con el identifier "irRegistro"
        performSegue(withIdentifier: "irRegistro", sender: self)
    }

}

