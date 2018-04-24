//
//  Triangle.swift
//  LR42
//
//  Created by Marty on 24/04/2018.
//  Copyright © 2018 Marty. All rights reserved.
//

import UIKit

class Triangle: SolidShape {
    private let vertex1: Point
    private let vertex2: Point
    private let vertex3: Point
    private let color    : UIColor
    private let fillColor: UIColor
    
    init(withVertex1 vrt1: Point, vertex2 vrt2: Point, vertex3 vrt3: Point, fillColor: UIColor, andOutlineColor color: UIColor) {
        vertex1 = vrt1
        vertex2 = vrt2
        vertex3 = vrt3
        self.color     = color
        self.fillColor = fillColor
    }
    
    // Protocol methods
    func getFillColor() -> UIColor {
        return fillColor
    }
    
    func getArea() -> Double {
        return abs((1/2) * (vertex1.x - vertex3.x) * (vertex2.y - vertex3.y) -
                           (vertex1.y - vertex3.y) * (vertex2.x - vertex3.x))
    }
    
    func getPerimeter() -> Double {
        let line1 = LineSegment(withStartPoint: vertex1, endPoint: vertex2, andColor: UIColor.black)
        let line2 = LineSegment(withStartPoint: vertex2, endPoint: vertex3, andColor: UIColor.black)
        let line3 = LineSegment(withStartPoint: vertex3, endPoint: vertex1, andColor: UIColor.black)
        
        return line1.getPerimeter() + line2.getPerimeter() + line3.getPerimeter()
    }
    
    func toString() -> String {
        let str = """
            Type: Triangle
            Vertex1: {\(vertex1.y), \(vertex1.x)}
            Vertex2: {\(vertex2.y), \(vertex2.x)}
            Vertex3: {\(vertex3.y), \(vertex3.x)}
            Outline Color: \(color)
            Fill Color   : \(fillColor)
            Area     : \(getArea())
            Perimeter: \(getPerimeter())
        """
        return str
    }
    
    func getOutlineColor() -> UIColor {
        return color
    }
    // End protocol methods
    
}
