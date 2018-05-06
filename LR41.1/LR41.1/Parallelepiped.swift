//
//  Parallelepiped.swift
//  LR41.1
//
//  Created by Marty on 18/04/2018.
//  Copyright © 2018 Marty. All rights reserved.
//

class Parallelepiped: Body {
    private var density: Double
    private var width  : Double
    private var height : Double
    private var depth  : Double
    
    init(withDensity density: Double, width: Double, height: Double, depth: Double) {
        self.density = abs(density)
        self.width   = abs(width)
        self.height  = abs(height)
        self.depth   = abs(depth)

    }
    
    func getDensity() -> Double {
        return density
    }
    
    func getVolume() -> Double {
        return width * height * depth
    }
    
    func getMass() -> Double {
        return density * getVolume()
    }
    
    func toStrint() -> String {
        let str = """
        name: Parallelepiped
        density: \(String(format: "%.03f", density))
        volume : \(String(format: "%.03f", getVolume()))
        mass   : \(String(format: "%.03f", getMass()))
        width  : \(String(format: "%.03f", width))
        height : \(String(format: "%.03f", height))
        depth  : \(String(format: "%.03f", depth))
        """
        
        return str
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
}
