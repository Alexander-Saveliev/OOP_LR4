//
//  field.swift
//  LR42
//
//  Created by Marty on 25/04/2018.
//  Copyright © 2018 Marty. All rights reserved.
//

import UIKit

class Field: UIView {
    private var shapes = [Shape]() {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override func draw(_ rect: CGRect) {
        for shape in shapes {
            if let line = shape as? LineSegment {
                drawOneLine(line)
            } else if let rect = shape as? Rectangle {
                drawOneRect(rect)
            } else if let circle = shape as? Circle {
                drawOneCircle(circle)
            } else if let triangle = shape as? Triangle {
                drawOneTriangle(triangle)
            }
        }
    }
    
    func addLine(_ line: LineSegment) {
        shapes.append(line as Shape)
    }
    
    func addRectangle(_ rect: Rectangle) {
        shapes.append(rect as Shape)
    }
    
    func addCircle(_ circle: Circle) {
        shapes.append(circle as Shape)
    }
    
    func addTriangle(_ triangle: Triangle) {
        shapes.append(triangle as Shape)
    }
    
    private func drawOneLine(_ line: LineSegment) {
        let linePath = UIBezierPath()
        
        linePath.lineWidth = 2
        
        
        linePath.move(to: CGPoint(x: line.getStartPoint().x, y: line.getStartPoint().y))
        linePath.addLine(to: CGPoint(x: line.getEndPoint().x, y: line.getEndPoint().y))
        
        linePath.close()
        
        line.getOutlineColor().setStroke()
        linePath.stroke()
    }
    
    private func drawOneRect(_ rect: Rectangle) {
        let rectCG = CGRect(x: rect.getLeftTop().x, y: rect.getLeftTop().y, width: rect.getWidth(), height: rect.getHeight())
        
        let path = UIBezierPath(rect: rectCG)
        
        rect.getFillColor().setFill()
        path.fill()
        rect.getOutlineColor().set()
        path.stroke()
    }
    
    private func drawOneCircle(_ circle: Circle) {
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: circle.getCenter().x, y: circle.getCenter().y),
                                      radius: CGFloat(circle.getRadius()),
                                      startAngle: CGFloat(0),
                                      endAngle: CGFloat(Double.pi * 2),
                                      clockwise: true)

        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath

        shapeLayer.fillColor = circle.getFillColor().cgColor
        shapeLayer.strokeColor = circle.getOutlineColor().cgColor
        shapeLayer.lineWidth = 2
        
        layer.addSublayer(shapeLayer)
    }
    
    private func drawOneTriangle(_ triangle: Triangle) {
        let linePath = UIBezierPath()
        
        linePath.lineWidth = 2
        
        linePath.move(to: CGPoint(x: triangle.getVertexOfNumber(1).x, y: triangle.getVertexOfNumber(1).y))
        linePath.addLine(to: CGPoint(x: triangle.getVertexOfNumber(2).x, y: triangle.getVertexOfNumber(2).y))
        linePath.addLine(to: CGPoint(x: triangle.getVertexOfNumber(3).x, y: triangle.getVertexOfNumber(3).y))
        linePath.addLine(to: CGPoint(x: triangle.getVertexOfNumber(1).x, y: triangle.getVertexOfNumber(1).y))
        linePath.close()
        
        triangle.getFillColor().setFill()
        linePath.fill()
        
        triangle.getOutlineColor().setStroke()
        linePath.stroke()
    }
}
