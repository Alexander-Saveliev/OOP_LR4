//
//  CSphere.swift
//  LR41
//
//  Created by Marty on 07/04/2018.
//  Copyright © 2018 Marty. All rights reserved.
//

import Foundation

class CSphere: CBody {
    private let radius: Double
    
    init(withDensity density: Double, level: Int, andRadius radius: Double) {
        self.radius = abs(radius)
        let volume  = (4 / 3) * (.pi * pow(self.radius, 3))
        
        super.init(withDensity: abs(density), level: level, andVolume: volume)
    }
    
    init?(withLevel level: Int) {
        guard let density = getAtributeFromInputWithMessage("density"),
              let radius  = getAtributeFromInputWithMessage("radius") else {
                return nil
        }
        
        self.radius = radius
        let volume  = (4 / 3) * (.pi * pow(radius, 3))
        super.init(withDensity: density, level: level, andVolume: volume)
    }
    
    func getRadius() -> Double {
        return radius
    }
    
    override func printDescription() {

        super.printDescription()
        print("Radius    : ", String(format: "%.03f", radius))
        print("Sphere")
        print()
    }
}
