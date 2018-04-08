//
//  CBody.swift
//  LR41
//
//  Created by Marty on 07/04/2018.
//  Copyright © 2018 Marty. All rights reserved.
//

class CBody {
    private let density: Double
    private let volume : Double
    private let level  : Int
    
    init(withDensity density: Double, level: Int, andVolume volume: Double) {
        self.density = density
        self.volume  = volume
        self.level   = level
    }
    
    func getLevel() -> Int {
        return level
    }
    
    func getDensity() -> Double {
        return density
    }
    
    func getVolume() -> Double {
        return volume
    }
    
    func getMass() -> Double {
        return volume * density
    }
    
    func printDescription() {
        print("+-------------+")
        print("   LEVEL ", level)
        print("+-------------+")
        print("Density   : ", density)
        print("Volume    : ", volume)
        print("Mass      : ", getMass())
    }
}
