//
//  InicioViewController.swift
//  iOSTecApp
//
//  Created by Alejandro Guzman on 10/11/24.
//

import UIKit

class InicioViewController: UIViewController {

    @IBOutlet weak var dirRecolecta1: UILabel!
    
    @IBOutlet weak var dirTaller1: UILabel!
    
    @IBOutlet weak var dirRecolecta2: UILabel!
    
    // UIViews para los círculos de progreso
    @IBOutlet weak var progressView1: UIView!
    @IBOutlet weak var progressView2: UIView!
    @IBOutlet weak var progressView3: UIView!
    
    // UILabels para mostrar el porcentaje de cada círculo de progreso
    @IBOutlet weak var progressLabel1: UILabel!
    @IBOutlet weak var progressLabel2: UILabel!
    @IBOutlet weak var progressLabel3: UILabel!
    
    // Capas para los círculos de progreso
    private var circularProgressLayer1 = CAShapeLayer()
    private var circularProgressLayer2 = CAShapeLayer()
    private var circularProgressLayer3 = CAShapeLayer()
    
    // Variables para almacenar el progreso de cada círculo
    private var progress1: Int = 0 {
        didSet { updateProgress(for: 1) }
    }
    private var progress2: Int = 0 {
        didSet { updateProgress(for: 2) }
    }
    private var progress3: Int = 0 {
        didSet { updateProgress(for: 3) }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        dirRecolecta1.text = "Av. Eugenio Garza Sada 1111 Sur,Tecnológico, 64849 Monterrey, N.L."
        dirTaller1.text = "Atlixcáyotl 0000, Reserva Territorial Atlixcáyotl, 72453 Heroica Puebla de Zaragoza, Pue."
        dirRecolecta2.text = "Atlixcáyotl 2222, Reserva Territorial Atlixcáyotl, 72453 Heroica Puebla de Zaragoza, Pue."
        
        // Configurar cada círculo de progreso
        setupCircularProgress(in: progressView1, layer: circularProgressLayer1)
        setupCircularProgress(in: progressView2, layer: circularProgressLayer2)
        setupCircularProgress(in: progressView3, layer: circularProgressLayer3)
        
        // Establecer valores de progreso de ejemplo
        setProgress(for: 1, to: 25)
        setProgress(for: 2, to: 50)
        setProgress(for: 3, to: 100)
    }
    
    // Configurar un círculo de progreso en un UIView específico
    private func setupCircularProgress(in view: UIView, layer: CAShapeLayer) {
        let center = CGPoint(x: view.bounds.width / 2, y: view.bounds.height / 2)
        let circularPath = UIBezierPath(arcCenter: center, radius: min(view.bounds.width, view.bounds.height) / 2 - 10, startAngle: -CGFloat.pi / 2, endAngle: 1.5 * CGFloat.pi, clockwise: true)
        
        // Capa de fondo del círculo
        let backgroundLayer = CAShapeLayer()
        backgroundLayer.path = circularPath.cgPath
        backgroundLayer.fillColor = UIColor.clear.cgColor
        backgroundLayer.strokeColor = UIColor.lightGray.cgColor
        backgroundLayer.lineWidth = 10
        view.layer.addSublayer(backgroundLayer)
        
        // Configurar la capa del círculo de progreso
        layer.path = circularPath.cgPath
        layer.fillColor = UIColor.clear.cgColor
        layer.strokeColor = UIColor.red.cgColor // Color inicial
        layer.lineWidth = 10
        layer.lineCap = .round
        layer.strokeEnd = 0
        view.layer.addSublayer(layer)
    }
    
    // Actualizar el progreso y el color de cada círculo
    private func updateProgress(for circle: Int) {
        var progressValue = 0
        var circularLayer: CAShapeLayer
        var progressLabel: UILabel
        
        switch circle {
        case 1:
            progressValue = progress1
            circularLayer = circularProgressLayer1
            progressLabel = progressLabel1
        case 2:
            progressValue = progress2
            circularLayer = circularProgressLayer2
            progressLabel = progressLabel2
        case 3:
            progressValue = progress3
            circularLayer = circularProgressLayer3
            progressLabel = progressLabel3
        default:
            return
        }
        
        // Actualizar el color según el valor de progreso
        switch progressValue {
        case 0..<25:
            circularLayer.strokeColor = UIColor.red.cgColor
        case 25..<50:
            circularLayer.strokeColor = UIColor.yellow.cgColor
        case 50..<75:
            circularLayer.strokeColor = UIColor.green.withAlphaComponent(0.5).cgColor
        case 75...100:
            circularLayer.strokeColor = UIColor.green.cgColor
        default:
            circularLayer.strokeColor = UIColor.red.cgColor
        }
        
        // Actualizar el círculo de progreso y el UILabel de porcentaje
        circularLayer.strokeEnd = CGFloat(progressValue) / 100
        progressLabel.text = "\(progressValue)%"
    }
    
    // Método para establecer el progreso en un círculo específico
    func setProgress(for circle: Int, to value: Int) {
        let clampedValue = min(max(value, 0), 100)
        
        switch circle {
        case 1:
            progress1 = clampedValue
        case 2:
            progress2 = clampedValue
        case 3:
            progress3 = clampedValue
        default:
            break
        }
    }

}
