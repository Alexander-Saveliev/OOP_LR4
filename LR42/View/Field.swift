//
//  field.swift
//  LR42
//
//  Created by Marty on 25/04/2018.
//  Copyright © 2018 Marty. All rights reserved.
//

import UIKit

class Field: UIView {
    private var lines      = [LineSegment]() {
        didSet {
            setNeedsDisplay()
        }
    }
    private var rectangles = [Rectangle]() {
        didSet {
            setNeedsDisplay()
        }
    }
    private var circles    = [Circle]() {
        didSet {
            setNeedsDisplay()
        }
    }
    private var triangles  = [Triangle]() {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override func draw(_ rect: CGRect) {
        print("update")
        for line in lines {
            drawOneLine(line)
        }
        
        for rect in rectangles {
            drawOneRect(rect)
        }
        
        for circle in circles {
            drawOneCircle(circle)
        }
        
        for triangle in triangles {
            drawOneTriangle(triangle)
        }
    }
    
    func addLine(_ line: LineSegment) {
        lines.append(line)
    }
    
    func addRectangle(_ rect: Rectangle) {
        rectangles.append(rect)
    }
    
    func addCircle(_ circle: Circle) {
        circles.append(circle)
    }
    
    func addTriangle(_ triangle: Triangle) {
        triangles.append(triangle)
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
