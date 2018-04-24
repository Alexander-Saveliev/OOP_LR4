//
//  Circle.swift
//  LR42
//
//  Created by Marty on 24/04/2018.
//  Copyright © 2018 Marty. All rights reserved.
//

import UIKit

class Circle: SolidShape {
    private let center: Point
    private let radius: Double
    private let color    : UIColor
    private let fillColor: UIColor
    
    init(withCenter center: Point, radius: Double, fillColor: UIColor, andOutlineColor color: UIColor) {
        self.center = center
        self.radius = radius
        self.fillColor = fillColor
        self.color     = color
    }
    
    // Protocol methods
    func getFillColor() -> UIColor {
        return fillColor
    }
    
    func getArea() -> Double {
        return pow(radius, 2) * .pi
    }
    
    func getPerimeter() -> Double {
        return 2 * .pi * radius
    }
    
    func toString() -> String {
        let str = """
            Type: Circle
            Center: {\(center.y), \(center.x)}
            Radius: \(radius)
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
    
    func getCenter() -> Point {
        return center
    }
    
    func getRadius() -> Double {
        return radius
    }
}
