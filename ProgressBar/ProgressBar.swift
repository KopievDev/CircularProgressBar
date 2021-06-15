//
//  ProgressBar.swift
//  ProgressBar
//
//  Created by Ivan Kopiev on 15.06.2021.
//

import UIKit

class ProgressBar: UIView {

    // MARK: - Properies
    @IBInspectable public var backgroundCircleColor: UIColor = UIColor.lightGray
    @IBInspectable public var starGradientColor: UIColor = UIColor.red
    @IBInspectable public var endGradientColor: UIColor = UIColor.orange
    @IBInspectable public var textColor: UIColor = UIColor.black

    
    private var backgroundLayer: CAShapeLayer!
    private var foregroundLayer: CAShapeLayer!
    private var textLayer: CATextLayer!
    private var gradientLayer: CAGradientLayer!
    
    public var progress: CGFloat = 0 {
        didSet {
            didProgressUpdate()
        }
    }
    
    // MARK: - Lifecycle
    override func draw(_ rect: CGRect) {
        
        guard layer.sublayers == nil else {return}
        // Propertie
        let lineWidth = 0.1 * min(rect.width, rect.height)
        // Setup layers
        backgroundLayer = createCircularLayer(rect: rect,
                                              strokeColor: backgroundCircleColor,
                                              fillColor: .clear,
                                              lineWidth: lineWidth)
        foregroundLayer = createCircularLayer(rect: rect,
                                              strokeColor: .red,
                                              fillColor: .clear,
                                              lineWidth: lineWidth)
        foregroundLayer.strokeEnd = progress
        textLayer = createTextLayer(rect: rect, textColor: .black)
        
        gradientLayer = CAGradientLayer()
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        gradientLayer.colors = [starGradientColor.cgColor, endGradientColor.cgColor]
        gradientLayer.frame = rect
        gradientLayer.mask = foregroundLayer
        
        layer.addSublayer(backgroundLayer)
        layer.addSublayer(gradientLayer)
        layer.addSublayer(textLayer)
        
        
    }
    
    // MARK: - Helpers
    private func createCircularLayer(rect: CGRect,
                                     strokeColor: UIColor,
                                     fillColor: UIColor,
                                     lineWidth: CGFloat) -> CAShapeLayer {
        let width = rect.width
        let height = rect.height
        let center = CGPoint(x: width/2, y: height/2)
        let radius = CGFloat(min(width, height) - lineWidth) / 2
        let circularPath = UIBezierPath(arcCenter: center, radius: radius, startAngle: -CGFloat.pi/2, endAngle: CGFloat.pi + CGFloat.pi/2, clockwise: true)
    
        // Setup layers
        let shapeLayer = CAShapeLayer() // Инициализация
        shapeLayer.path = circularPath.cgPath // Путь
        shapeLayer.strokeColor = strokeColor.cgColor // Цвет линии
        shapeLayer.fillColor = fillColor.cgColor // Цвет заливки
        shapeLayer.lineWidth = lineWidth // Ширина линии
        shapeLayer.lineCap = .round // Закругление линии
        
        return shapeLayer
    }
    
    private func createTextLayer(rect: CGRect, textColor: UIColor) -> CATextLayer {
        let width = rect.width
        let height = rect.height
        
        let fontSize = min(height, width) / 4
        let offset = min(width, height) * 0.1
        
        let layer = CATextLayer()
        layer.string = "\(Int(foregroundLayer.strokeEnd * 100))"
        layer.backgroundColor = UIColor.clear.cgColor
        layer.foregroundColor = textColor.cgColor
        layer.fontSize = fontSize
        layer.frame = CGRect(x: 0, y: (height-fontSize-offset)/2,
                             width: width, height: fontSize+offset)
        layer.alignmentMode = .center
        return layer
    }
    
    private func didProgressUpdate() {
        textLayer.string = "\(Int(progress * 100))"
        foregroundLayer.strokeEnd = progress
        print("Debug \(foregroundLayer.strokeEnd)")
    }
}
