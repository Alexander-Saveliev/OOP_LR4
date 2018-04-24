//
//  Cone.swift
//  LR41.1
//
//  Created by Marty on 18/04/2018.
//  Copyright © 2018 Marty. All rights reserved.
//

import Foundation

class Cone: Body {
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
        return (1/3) * .pi * pow(baseRadius, 2) * height
    }
    
    func getMass() -> Double {
        return density * getVolume()
    }
    
    func toStrint() -> String {
        let str = """
        name   : Cone
        density: \(density)
        volume : \(getVolume())
        mass   : \(getMass())
        radius : \(baseRadius)
        height : \(height)
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
