//
//  Compound.swift
//  LR41.1
//
//  Created by Marty on 18/04/2018.
//  Copyright © 2018 Marty. All rights reserved.
//

class Compound: Body {
    private var parts = [Body]()
    private var parent: Compound?
    
    func getDensity() -> Double {
        let mass   = getMass()
        let volume = getVolume()
        
        return volume == 0 ? 0 : mass / volume
    }
    
    func getVolume() -> Double {
        var sum = 0.0
        
        for body in parts {
            sum += body.getVolume()
        }
        
        return sum
    }
    
    func getMass() -> Double {
        var sum = 0.0
        
        for body in parts {
            sum += body.getMass()
        }
        
        return sum
    }
    
    func toStrint() -> String {
        let str = """
        name   : Compound
        parts  : \(parts.count)
        density: \(getDensity())
        volume : \(getVolume())
        mass   : \(getMass())
        """
        
        return str
    }
    
    func getChields() -> [Body] {
        return parts
    }
    
    func addChieldBody(_ body: Body) -> Bool {
        var current = self
        
        if current === body {
            return false
        }
        
        while current.parent != nil {
            if current.parent! === body {
                return false
            }
            current = current.parent!
        }
        
        if let compoundBody = body as? Compound {
            compoundBody.parent = self
        }
        
        parts.append(body)
        
        return true
    }
}
