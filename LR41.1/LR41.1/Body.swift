//
//  Body.swift
//  LR41.1
//
//  Created by Marty on 18/04/2018.
//  Copyright © 2018 Marty. All rights reserved.
//

protocol Body: class {
    func getDensity() -> Double
    func getVolume()  -> Double
    func getMass()    -> Double
    func toStrint()   -> String
}
