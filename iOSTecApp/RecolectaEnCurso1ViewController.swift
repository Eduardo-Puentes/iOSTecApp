//
//  RecolectaEnCurso1ViewController.swift
//  iOSTecApp
//
//  Created by Alejandro Guzman on 10/11/24.
//

import UIKit

class RecolectaEnCurso1ViewController: UIViewController {
    
    @IBOutlet weak var dirRecolecta: UILabel!
    
    @IBOutlet weak var textoPrincipal: UILabel!
    
    
    @IBOutlet weak var progressView: UIView! // UIView para la barra circular

    @IBOutlet weak var progressLabel: UILabel!
    
    private var circularProgressLayer = CAShapeLayer()
    private var backgroundLayer = CAShapeLayer()
    
    private var progress: Int = 0 {
        didSet {
            updateProgressColor()
            circularProgressLayer.strokeEnd = CGFloat(progress) / 100
            progressLabel.text = "\(progress)%" // Actualizar el label con el valor de progreso
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dirRecolecta.text = "Av. Eugenio Garza Sada 2501 Sur,Tecnológico, 0000 Monterrey, N.L."
        textoPrincipal.text = "Loreeem ipsum dolor sit amet, consectetur adipiscing elit. Quisque odio justo, semper rutrum purus et, facilisis viverra lorem. Fusce ut blandit quam, a maximus lorem. In malesuada consectetur arcu rhoncus viverra. Donec scelerisque mattis dolor at sagittis. Cras tempor porta convallis. Fusce vitae nulla vitae magna ultrices iaculis eget non nisi. Nunc id congue sapien, elementum viverra dui. Curabitur ultricies ipsum elementum, tempor lectus et, tempor est. Nulla viverra vulputate metus eget pharetra.Recibimos Cartón Tetrapack Cajas Placas de Cartón Fusce at mollis felis. Nulla iaculis tortor quis nunc molestie, ut laoreet augue auctor. Nulla facilisi. Pellentesque a nibh risus. Duis at scelerisque massa. Duis consectetur ornare porttitor. Etiam eget suscipit nisi. Donec pharetra libero dui, tempus commodo leo auctor nec. Integer in augue pulvinar, posuere lectus a, gravida magna. "
        
        
        // Configurar el círculo de progreso dentro de progressView
        setupCircularProgress()
        
        // Prueba con un progreso del 50%
        setProgress(to: 82)
    }
    
    private func setupCircularProgress() {
        guard let progressView = progressView else { return }
        
        let center = CGPoint(x: progressView.bounds.width / 2, y: progressView.bounds.height / 2)
        let circularPath = UIBezierPath(arcCenter: center, radius: min(progressView.bounds.width, progressView.bounds.height) / 2 - 10, startAngle: -CGFloat.pi / 2, endAngle: 1.5 * CGFloat.pi, clockwise: true)
        
        // Capa de fondo del círculo
        backgroundLayer.path = circularPath.cgPath
        backgroundLayer.fillColor = UIColor.clear.cgColor
        backgroundLayer.strokeColor = UIColor.lightGray.cgColor
        backgroundLayer.lineWidth = 10
        progressView.layer.addSublayer(backgroundLayer)
        
        // Capa de progreso del círculo
        circularProgressLayer.path = circularPath.cgPath
        circularProgressLayer.fillColor = UIColor.clear.cgColor
        circularProgressLayer.strokeColor = UIColor.red.cgColor // Color inicial
        circularProgressLayer.lineWidth = 10
        circularProgressLayer.lineCap = .round
        circularProgressLayer.strokeEnd = 0
        progressView.layer.addSublayer(circularProgressLayer)
    }
    
    private func updateProgressColor() {
        switch progress {
        case 0..<25:
            circularProgressLayer.strokeColor = UIColor.red.cgColor
        case 25..<50:
            circularProgressLayer.strokeColor = UIColor.yellow.cgColor
        case 50..<75:
            circularProgressLayer.strokeColor = UIColor.green.withAlphaComponent(0.5).cgColor
        case 75...100:
            circularProgressLayer.strokeColor = UIColor.green.cgColor
        default:
            circularProgressLayer.strokeColor = UIColor.red.cgColor
        }
    }

    func setProgress(to value: Int) {
        progress = min(max(value, 0), 100) // Asegurarse de que esté entre 0 y 100
    }
}
