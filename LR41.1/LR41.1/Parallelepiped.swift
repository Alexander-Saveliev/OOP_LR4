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
        density: \(density)
        volume : \(getVolume())
        mass   : \(getMass())
        width  : \(width)
        height : \(height)
        depth  : \(depth)
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
