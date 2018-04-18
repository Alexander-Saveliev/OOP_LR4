//
//  CCompound.swift
//  LR41
//
//  Created by Marty on 08/04/2018.
//  Copyright © 2018 Marty. All rights reserved.
//

class CCompound: CBody {
    private var parts = [CBody]()
    
    init(withLevel level: Int) {
        super.init(withDensity: 0, level: level, andVolume: 0)
        parts = getListOfBodiesOfLevel(level)
    }
    
    func addChieldBody(_ chield: CBody) -> Bool {
        if chield === self || parts.contains(where: { $0 === chield }) {
            return false
        }

        parts.append(chield)
        
        return true
    }
    
    override func getMass() -> Double {
        var sum = 0.0
        
        for body in parts {
            sum += body.getMass()
        }
        
        return sum
    }
    
    override func getVolume() -> Double {
        var sum = 0.0
        
        for body in parts {
            sum += body.getVolume()
        }
        
        return sum
    }
    
    override func getDensity() -> Double {
        let mass   = getMass()
        let volume = getVolume()
        
        return volume == 0 ? 0 : mass / volume
    }
    
    override func printDescription() {
        print("+-------------+")
        print("   LEVEL ", getLevel())
        print("+-------------+")
        print("Density   : ", String(format: "%.03f", getDensity()))
        print("Volume    : ", String(format: "%.03f", getVolume()))
        print("Mass      : ", String(format: "%.03f", getMass()))
        print("Number of parts: ", parts.count)
        print("Compound")
        print()
        
        for body in parts {
            print(String(describing: type(of: body)))
            body.printDescription()
        }
    }
}















