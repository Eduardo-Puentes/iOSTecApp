//
//  RankingViewController.swift
//  iOSTecApp
//
//  Created by Alejandro Guzman on 10/11/24.
//

import UIKit

class RankingViewController: UIViewController {
    
    @IBOutlet weak var nombreRank1: UILabel!
    
    @IBOutlet weak var nombreRank2: UILabel!
    
    @IBOutlet weak var nombreRank3: UILabel!
    
    @IBOutlet weak var nombreRank4: UILabel!
    
    @IBOutlet weak var nombreRank5: UILabel!
    
    @IBOutlet weak var nombreRank6: UILabel!
    
    @IBOutlet weak var nombreRank7: UILabel!
    
    @IBOutlet weak var nombreRank8: UILabel!
    
    @IBOutlet weak var nombreRank9: UILabel!
    
    @IBOutlet weak var nombreRank10: UILabel!
    
    
    @IBOutlet weak var rank1: UILabel!
    
    @IBOutlet weak var rank2: UILabel!
    
    @IBOutlet weak var rank3: UILabel!
    
    @IBOutlet weak var rank4: UILabel!
    
    @IBOutlet weak var rank5: UILabel!
    
    @IBOutlet weak var rank6: UILabel!
    
    @IBOutlet weak var rank7: UILabel!
    
    @IBOutlet weak var rank8: UILabel!
    
    @IBOutlet weak var rank9: UILabel!
    
    @IBOutlet weak var rank10: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        nombreRank1.text = "Luis Isaías Montes Ricooo"
        nombreRank2.text = "Sofía Martínez Lópezzz"
        nombreRank3.text = "Carlos Fernández Ruizzz"
        nombreRank4.text = "María Isabel Gómez Herreraaa"
        nombreRank5.text = "Javier Ramírez Sánchezzz"
        nombreRank6.text = "Lucía Navarro Torresss"
        nombreRank7.text = "Andrés Gutiérrez Pérezzz"
        nombreRank8.text = "Gabriela Castillo Moralesss"
        nombreRank9.text = "Fernando Rojas Garcíaaa"
        nombreRank10.text = "Ana Patricia Ortega Jiménezzz"
        
        rank1.text = "20"
        rank2.text = "19"
        rank3.text = "18"
        rank4.text = "17"
        rank5.text = "16"
        rank6.text = "15"
        rank7.text = "14"
        rank8.text = "13"
        rank9.text = "12"
        rank10.text = "11"
        
        
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
