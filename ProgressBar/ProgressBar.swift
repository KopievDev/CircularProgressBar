//
//  ProgressBar.swift
//  ProgressBar
//
//  Created by Ivan Kopiev on 15.06.2021.
//

import UIKit

class ProgressBar: UIView {

    // MARK: - Properies
    private var backgroundLayer: CAShapeLayer!
    private var foregroundLayer: CAShapeLayer!
    private var textLayer: CATextLayer!
    
    public var progress: CGFloat = 0 {
        didSet {
            didProgressUpdate()
        }
    }
    
    // MARK: - Lifecycle
    override func draw(_ rect: CGRect) {
        // Propertie
        let lineWidth = 0.1 * min(rect.width, rect.height)
        // Setup layers
        backgroundLayer = createCircularLayer(rect: rect,
                                              strokeColor: .lightGray,
                                              fillColor: .clear,
                                              lineWidth: lineWidth)
        foregroundLayer = createCircularLayer(rect: rect,
                                              strokeColor: .red,
                                              fillColor: .clear,
                                              lineWidth: lineWidth)
        foregroundLayer.strokeEnd = progress
        textLayer = createTextLayer(rect: rect, textColor: .black)

        layer.addSublayer(backgroundLayer)
        layer.addSublayer(foregroundLayer)
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
