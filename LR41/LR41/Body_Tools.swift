//
//  Body_Tools.swift
//  LR41
//
//  Created by Marty on 08/04/2018.
//  Copyright © 2018 Marty. All rights reserved.
//

func getAtributeFromInputWithMessage(_ message: String) -> Double? {
    print(message, terminator: ": ")
    
    let input = readLine() ?? ""
    
    guard let toDouble = Double(input) else {
        return nil
    }
    
    return toDouble
}

func getListOfBodiesOfLevel(_ level: Int) -> [CBody] {
    var bodies = [CBody]()
    
    var instruction = Command(rawValue: readLine() ?? "") ?? .error
    
    while instruction != .end {
        switch instruction {
        case .sphere:
            if let newBody = CSphere(withLevel: level + 1) {
                bodies.append(newBody)
            }
        case .parallelepiped:
            if let newBody = CParallelepiped(withLevel: level + 1) {
                bodies.append(newBody)
            }
        case .cone:
            if let newBody = CCone(withLevel: level + 1) {
                bodies.append(newBody)
            }
        case .cylinder:
            if let newBody = CCylynder(withLevel: level + 1) {
                bodies.append(newBody)
            }
        case .compound:
            bodies.append(CCompound(withLevel: level + 1))
        default:
            break
        }
        
        instruction = Command(rawValue: readLine() ?? "") ?? .error
    }
    
    return bodies
}

