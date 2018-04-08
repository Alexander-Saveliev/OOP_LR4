//
//  CCylinder.swift
//  LR41
//
//  Created by Marty on 08/04/2018.
//  Copyright © 2018 Marty. All rights reserved.
//

import Foundation

class CCylynder: CBody {
    private let radius: Double
    private let height: Double
    
    init(withDensity density: Double, baseRadius radius: Double, level: Int, andHeight height: Double) {
        let volume = .pi * pow(radius, 2) * height
        
        self.radius = radius
        self.height = height
        
        super.init(withDensity: density, level: level, andVolume: volume)
    }
    
    init?(withLevel level: Int) {
        guard let density = getAtributeFromInputWithMessage("density"),
              let radius   = getAtributeFromInputWithMessage("radius"),
              let height  = getAtributeFromInputWithMessage("height")
            else {
                return nil
        }
        
        let volume = .pi * pow(radius, 2) * height
        
        self.radius = radius
        self.height = height
        
        super.init(withDensity: density, level: level, andVolume: volume)
    }
    
    func getBaseRadiud() -> Double {
        return radius
    }
    
    func getHeight() -> Double {
        return height
    }
    
    override func printDescription() {
        super.printDescription()
        print("BaseRadius: ", radius)
        print("Height    : ", height)
        print("Cylinder")
        print()
    }
}
