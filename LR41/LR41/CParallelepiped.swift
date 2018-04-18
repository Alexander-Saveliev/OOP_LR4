//
//  CParallelepiped.swift
//  LR41
//
//  Created by Marty on 07/04/2018.
//  Copyright © 2018 Marty. All rights reserved.
//

class CParallelepiped: CBody {
    private let width : Double
    private let height: Double
    private let depth : Double
    
    init(withDensity density: Double, level: Int, width: Double, height: Double, depth: Double) {
        self.width  = abs(width)
        self.height = abs(height)
        self.depth  = abs(depth)
        
        let volume = self.width * self.height * self.depth;
        
        super.init(withDensity: abs(density), level: level, andVolume: volume)
    }
    
    init?(withLevel level: Int) {
        guard let density = getAtributeFromInputWithMessage("density"),
              let width   = getAtributeFromInputWithMessage("width"),
              let height  = getAtributeFromInputWithMessage("height"),
              let depth   = getAtributeFromInputWithMessage("depth")
        else {
            return nil
        }
        
        self.width  = width
        self.height = height
        self.depth  = depth
        
        let volume = width * height * depth;
        
        super.init(withDensity: density, level: level, andVolume: volume)
    }
    
    func getWidth() -> Double {
        return width
    }
    
    func getHeight() -> Double {
        return height
    }
    
    func getDepth() -> Double {
        return depth
    }
    
    override func printDescription() {
        super.printDescription()
        print("Width     : ", String(format: "%.03f", width))
        print("Height    : ", String(format: "%.03f", height))
        print("Depth     : ", String(format: "%.03f", depth))
        print("Parallelepiped")
        print()
    }
}
