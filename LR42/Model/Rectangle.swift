//
//  Rectangle.swift
//  LR42
//
//  Created by Marty on 24/04/2018.
//  Copyright © 2018 Marty. All rights reserved.
//

import UIKit

class Rectangle: SolidShape {
    private let leftTop: Point
    private let width  : Double
    private let height : Double
    private let color    : UIColor
    private let fillColor: UIColor
    
    init(withLeftTop leftTop: Point, width: Double, height: Double, fillColor: UIColor, andOutlineColor color: UIColor) {
        self.leftTop = leftTop
        self.width   = abs(width)
        self.height  = abs(height)
        self.color     = color
        self.fillColor = fillColor
    }
    
    // Protocol methods
    func getFillColor() -> UIColor {
        return fillColor
    }
    
    func getArea() -> Double {
        return width * height
    }
    
    func getPerimeter() -> Double {
        return 2 * (width + height)
    }
    
    func toString() -> String {
        let str = """
            Type: Rectangle
            Left Top Point: {\(leftTop.y), \(leftTop.x)}
            Width : \(width)
            Height: \(height)
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
    
    func getLeftTop() -> Point {
        return leftTop
    }
    
    func getRightBottom() -> Point {
        return Point(withY: leftTop.y + height, andX: leftTop.x + width )
    }
    
    func getWidth() -> Double {
        return width
    }
    
    func getHeight() -> Double {
        return height
    }
}
