//
//  Cone.swift
//  LR41.1
//
//  Created by Marty on 18/04/2018.
//  Copyright © 2018 Marty. All rights reserved.
//

import Foundation

class Cylinder: Body {
    private var density   : Double
    private var baseRadius: Double
    private var height    : Double
    
    init(withDensity density: Double, baseRadius: Double, height: Double) {
        self.density    = abs(density)
        self.baseRadius = abs(baseRadius)
        self.height     = abs(height)
    }
    
    func getDensity() -> Double {
        return density
    }
    
    func getVolume() -> Double {
        return .pi * pow(baseRadius, 2) * height
    }
    
    func getMass() -> Double {
        return density * getVolume()
    }
    
    func toStrint() -> String {
        let str = """
        name   : Cylinder
        density: \(String(format: "%.03f", density))
        volume : \(String(format: "%.03f", getVolume()))
        mass   : \(String(format: "%.03f", getMass()))
        radius : \(String(format: "%.03f", baseRadius))
        height : \(String(format: "%.03f", height))
        """
        
        return str
    }
    
    func getBaseRadius() -> Double {
        return baseRadius
    }
    
    func getHeight() -> Double {
        return height
    }
}
