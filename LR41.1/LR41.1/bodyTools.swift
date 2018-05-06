//
//  bodyTools.swift
//  LR41.1
//
//  Created by Marty on 18/04/2018.
//  Copyright © 2018 Marty. All rights reserved.
//

func readingFromInput() -> [Body] {
    var bodies = [Body]()
    
    var instruction = Command(rawValue: readLine() ?? "") ?? .error
    
    while instruction != .end {
        switch instruction {
        case .sphere:
            if let density = readDoubleWithMessage("Density"),
                let radius = readDoubleWithMessage("Radius") {
                let sphere = Sphere(withDensity: density, radius: radius)
                bodies.append(sphere)
            } else {
                print("Incorrect value")
            }
            
        case .parallelepiped:
            if let density = readDoubleWithMessage("Density"),
                let width  = readDoubleWithMessage("Width"),
                let height = readDoubleWithMessage("Height"),
                let depth  = readDoubleWithMessage("Depth") {
                let parallelepiped = Parallelepiped(withDensity: density, width: width, height: height, depth: depth)
                bodies.append(parallelepiped)
            } else {
                print("Incorrect value")
            }
        case .cone:
            if let density = readDoubleWithMessage("Density"),
                let baseRadius = readDoubleWithMessage("Base Radius"),
                let height     = readDoubleWithMessage("Height") {
                let cone = Cone(withDensity: density, baseRadius: baseRadius, height: height)
                bodies.append(cone)
            } else {
                print("Incorrect value")
            }
        case .cylinder:
            if let density = readDoubleWithMessage("Density"),
                let baseRadius = readDoubleWithMessage("Base Radius"),
                let height     = readDoubleWithMessage("Height") {
                let cylinder = Cylinder(withDensity: density, baseRadius: baseRadius, height: height)
                bodies.append(cylinder)
            } else {
                print("Incorrect value")
            }
        case .compound:
            let compound = Compound()
            let compoundBodies = readingFromInput()
            
            for body in compoundBodies {
                if !compound.addChieldBody(body) {
                    print("Incorrect inserting")
                }
                
            }
            bodies.append(compound)
        case .heaviest:
            if let heaviest = getTheHeviestBodyFromList(bodies) {
                print(heaviest.toStrint())
            }
        case .light:
            if let light = getTheLightWeightInWhaterFromList(bodies) {
                print(light.toStrint())
            }
        default:
            break
        }
        
        instruction = Command(rawValue: readLine() ?? "") ?? .error
    }
    
    
    return bodies
}

func printReportOfList(_ bodies: [Body], withLevel level: Int) {
    for body in bodies {
        if type(of: body) == Compound.self {
            print("== LEVEL \(level) ==")
            print(body.toStrint())
            
            print()
            print("Chields")
            printReportOfList((body as! Compound).getChields(), withLevel: level + 1)
            print("End Chields")
        } else {
            print(body.toStrint())
            print()
        }
    }
}

func getTheHeviestBodyFromList(_ bodies: [Body]) -> Body? {
    var currentHeaviest: Body?
    
    for body in bodies {
        if currentHeaviest == nil || body.getMass() > currentHeaviest!.getMass() {
            currentHeaviest = body
        }
    }
    
    return currentHeaviest
}

func getTheLightWeightInWhaterFromList(_ bodies: [Body]) -> Body? {
    let whaterDensity = 1000.0
    var currentLight: Body?
    var currentMass : Double!
    
    for body in bodies {
        let mass = body.getVolume() * (body.getDensity() - whaterDensity)
        
        if currentLight == nil || mass < currentMass {
            currentLight = body
            currentMass  = mass
        }
    }
    
    return currentLight
}

func readDoubleWithMessage(_ message: String) -> Double? {
    print(message, terminator: ": ")
    
    let input = readLine() ?? ""
    
    guard let toDouble = Double(input) else {
        return nil
    }
    
    return abs(toDouble)
}
