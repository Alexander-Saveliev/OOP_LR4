//
//  LineSegment.swift
//  LR42
//
//  Created by Marty on 24/04/2018.
//  Copyright © 2018 Marty. All rights reserved.
//

import Foundation
import UIKit

class LineSegment: Shape {
    private let startPoint: Point
    private let endPoint  : Point
    private let color     : UIColor
    
    init(withStartPoint start: Point, endPoint end: Point, andColor color: UIColor) {
        startPoint = start
        endPoint   = end
        self.color = color
    }
    
    init(withStartY startY: Double, startX: Double, endY: Double, endX: Double, andColor color: UIColor ) {
        startPoint = Point(withY: startY, andX: startX)
        endPoint   = Point(withY: endY, andX: endX)
        self.color = color
    }
    
    // Protocol methods
    func getArea() -> Double {
        return 0
    }
    
    func getPerimeter() -> Double {
        return sqrt(pow(startPoint.y - endPoint.y, 2) + pow(startPoint.x - endPoint.x, 2))
    }
    
    func toString() -> String {
        let str = """
            Type: Line Segment
            Start Point: {\(startPoint.y), \(startPoint.x)}
            End Point  : {\(endPoint.y), \(endPoint.x)}
            Color      : \(color)
        """
        
        return str
    }
    
    func getOutlineColor() -> UIColor {
        return color
    }
    // End protocol methods
    
    func getStartPoint() -> Point {
        return startPoint
    }
    
    func getEndPoint() -> Point {
        return endPoint
    }
}
