//
//  Shape_tools.swift
//  LR42
//
//  Created by Marty on 24/04/2018.
//  Copyright © 2018 Marty. All rights reserved.
//

func getShapeWithMaxArea(_ shapes:[Shape]) -> Shape? {
    var shapeWithMaxArea: Shape!
    
    for shape in shapes {
        if (shapeWithMaxArea == nil || shape.getArea() > shapeWithMaxArea.getArea()) {
            shapeWithMaxArea = shape
        }
    }
    
    return shapeWithMaxArea
}

func getShapeWithMinPerimeter(_ shapes:[Shape]) -> Shape? {
    var shapeWithMinPerimeter: Shape!
    
    for shape in shapes {
        if (shapeWithMinPerimeter == nil || shape.getPerimeter() > shapeWithMinPerimeter.getPerimeter()) {
            shapeWithMinPerimeter = shape
        }
    }
    
    return shapeWithMinPerimeter
}
