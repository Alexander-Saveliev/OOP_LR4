//
//  Shape.swift
//  LR42
//
//  Created by Marty on 24/04/2018.
//  Copyright © 2018 Marty. All rights reserved.
//

import UIKit

protocol Shape {
    func getArea()         -> Double
    func getPerimeter()    -> Double
    func toString()        -> String
    func getOutlineColor() -> UIColor
}
