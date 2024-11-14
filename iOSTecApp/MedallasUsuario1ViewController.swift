//
//  MedallasUsuario1ViewController.swift
//  iOSTecApp
//
//  Created by Alejandro Guzman on 10/11/24.
//

import UIKit

class MedallasUsuario1ViewController: UIViewController {
    
    
    @IBOutlet weak var nombreUsuario: UILabel!
    
    @IBOutlet weak var medallasCafe: UILabel!
    
    @IBOutlet weak var medallasAzul: UILabel!
    
    @IBOutlet weak var medallasAmarillo: UILabel!
    
    @IBOutlet weak var medallasMorado: UILabel!
    
    @IBOutlet weak var textoMedallaCafe: UILabel!
    

    @IBOutlet weak var textoMedallaAzul: UILabel!
    
    
    @IBOutlet weak var textoMedallaAmarilla: UILabel!
    
    
    @IBOutlet weak var textoMedallaMorada: UILabel!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nombreUsuario.text = "Alejandro Guzmán Sánchez"

        medallasCafe.text = "20"
        medallasAzul.text = "55"
        medallasAmarillo.text = "9"
        medallasMorado.text = "18"
        
        textoMedallaCafe.text = "Entregaste 12kg de Cartón"
        textoMedallaAzul.text = "Gasto de agua reducido un 38%"
        textoMedallaAmarilla.text = "7 Carpools este mes"
        textoMedallaMorada.text = "15 Carpools este mes"
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
