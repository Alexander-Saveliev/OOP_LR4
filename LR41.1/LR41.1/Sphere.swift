//
//  Sphere.swift
//  LR41.1
//
//  Created by Marty on 18/04/2018.
//  Copyright © 2018 Marty. All rights reserved.
//

import Foundation

class Sphere: Body {
    private var density: Double
    private var radius : Double
    
    init(withDensity density: Double, radius: Double) {
        self.density = abs(density)
        self.radius  = abs(radius)
    }
    
    func getDensity() -> Double {
        return density
    }
    
    func getVolume() -> Double {
        return (4/3) * .pi * pow(radius, 3)
    }
    
    func getMass() -> Double {
        return density * getVolume()
    }
    
    func toStrint() -> String {
        let str = """
        name: Sphere
        density: \(String(format: "%.03f", density))
        volume : \(String(format: "%.03f", getVolume()))
        mass   : \(String(format: "%.03f", getMass()))
        radius : \(String(format: "%.03f", radius))
        """
        
        return str
    }
    
    
    func getRadius() -> Double {
        return radius
    }
}
