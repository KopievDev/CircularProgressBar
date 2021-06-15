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
    
    // MARK: - Lifecycle
    override func draw(_ rect: CGRect) {
        // Properties
        let width = rect.width
        let height = rect.height
        
        let lineWidth = 0.1 * min(width, height)
        let center = CGPoint(x: width/2, y: height/2)
        let radius = CGFloat(min(width, height) - lineWidth) / 2
        let circularPath = UIBezierPath(arcCenter: center, radius: radius, startAngle: -CGFloat.pi/2, endAngle: CGFloat.pi + CGFloat.pi/2, clockwise: true)
    
        
        backgroundLayer = createCircularLayer(rect: rect, strokeColor: .lightGray, fillColor: .clear, lineWidth: 20)
        foregroundLayer = createCircularLayer(rect: rect, strokeColor: .red, fillColor: .clear, lineWidth: 20)
        foregroundLayer.strokeEnd = 0.5
        // Setup layers
//        backgroundLayer = CAShapeLayer() // Инициализация
//        backgroundLayer.path = circularPath.cgPath // Путь
//        backgroundLayer.strokeColor = UIColor.lightGray.cgColor // Цвет линии
//        backgroundLayer.fillColor = UIColor.clear.cgColor // Цвет заливки
//        backgroundLayer.lineWidth = lineWidth // Ширина линии
//        backgroundLayer.lineCap = .round // Закругление линии
        layer.addSublayer(backgroundLayer)
        
//        foregroundLayer = CAShapeLayer()
//        foregroundLayer.path = circularPath.cgPath
//        foregroundLayer.strokeColor = UIColor.red.cgColor
//        foregroundLayer.fillColor = UIColor.clear.cgColor
//        foregroundLayer.lineWidth = lineWidth
//        foregroundLayer.lineCap = .round
//        foregroundLayer.strokeEnd = 0.5
        layer.addSublayer(foregroundLayer)
        
        textLayer = CATextLayer()
        textLayer.alignmentMode = .center
        textLayer.fontSize = 20
        textLayer.string = foregroundLayer.strokeEnd * 100
        textLayer.borderColor = UIColor.black.cgColor
        
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
}
