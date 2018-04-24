//
//  test_LR41.swift
//  test_LR41
//
//  Created by Marty on 24/04/2018.
//  Copyright © 2018 Marty. All rights reserved.
//

import XCTest

class test_LR41: XCTestCase {
    
    // MARK: - Sphere -
    func testSphere() {
        let sphere = Sphere(withDensity: 10, radius: 1)
        
        XCTAssertEqual(sphere.getDensity(), 10, accuracy: 0.5);
        XCTAssertEqual(sphere.getVolume(), 4.1867, accuracy: 0.5);
        XCTAssertEqual(sphere.getMass(), 41.867, accuracy: 0.5);
        XCTAssertEqual(sphere.getRadius(), 1, accuracy: 0.5);
    }
    
    func testSphereWithWrongParameters() {
        let sphere = Sphere(withDensity: -10, radius: -1)
        
        XCTAssertEqual(sphere.getDensity(), 10, accuracy: 0.5);
        XCTAssertEqual(sphere.getVolume(), 4.1867, accuracy: 0.5);
        XCTAssertEqual(sphere.getMass(), 41.867, accuracy: 0.5);
        XCTAssertEqual(sphere.getRadius(), 1, accuracy: 0.5);
    }

    // MARK: - Parallelepiped -
    func testParallelepiped() {
        let parallelepiped = Parallelepiped(withDensity: 10, width: 2, height: 3, depth: 4)
        
        XCTAssertEqual(parallelepiped.getDensity(), 10, accuracy: 0.5);
        XCTAssertEqual(parallelepiped.getVolume(), 24, accuracy: 0.5);
        XCTAssertEqual(parallelepiped.getMass(), 240, accuracy: 0.5);
        XCTAssertEqual(parallelepiped.getWidth(), 2, accuracy: 0.5);
        XCTAssertEqual(parallelepiped.getHeight(), 3, accuracy: 0.5);
        XCTAssertEqual(parallelepiped.getDepth(), 4, accuracy: 0.5);
    }
    
    func testParallelepipedWithWrongParameters() {
        let parallelepiped = Parallelepiped(withDensity: -10, width: -2, height: -3, depth: -4)
        
        XCTAssertEqual(parallelepiped.getDensity(), 10, accuracy: 0.5);
        XCTAssertEqual(parallelepiped.getVolume(), 24, accuracy: 0.5);
        XCTAssertEqual(parallelepiped.getMass(), 240, accuracy: 0.5);
        XCTAssertEqual(parallelepiped.getWidth(), 2, accuracy: 0.5);
        XCTAssertEqual(parallelepiped.getHeight(), 3, accuracy: 0.5);
        XCTAssertEqual(parallelepiped.getDepth(), 4, accuracy: 0.5);
    }
    
    // MARK: - Cone -
    func testCone() {
        let cone = Cone(withDensity: 5, baseRadius: 3, height: 4)
        
        XCTAssertEqual(cone.getDensity(), 5, accuracy: 0.5)
        XCTAssertEqual(cone.getVolume(), 37.68, accuracy: 0.5)
        XCTAssertEqual(cone.getMass(), 188.4, accuracy: 0.5)
        XCTAssertEqual(cone.getHeight(), 4, accuracy: 0.5)
        XCTAssertEqual(cone.getBaseRadius(), 3, accuracy: 0.5)
    }
    
    func testConeWithWrongParameters() {
        let cone = Cone(withDensity: -5, baseRadius: -3, height: -4)
        
        XCTAssertEqual(cone.getDensity(), 5, accuracy: 0.5)
        XCTAssertEqual(cone.getVolume(), 37.68, accuracy: 0.5)
        XCTAssertEqual(cone.getMass(), 188.4, accuracy: 0.5)
        XCTAssertEqual(cone.getHeight(), 4, accuracy: 0.5)
        XCTAssertEqual(cone.getBaseRadius(), 3, accuracy: 0.5)
    }
    
    // MARK: - Cylinder -
    func testCylinder() {
        let cylinder = Cylinder(withDensity: 2, baseRadius: 3, height: 3)
        
        XCTAssertEqual(cylinder.getDensity(), 2, accuracy: 0.5)
        XCTAssertEqual(cylinder.getVolume(), 84.78, accuracy: 0.5)
        XCTAssertEqual(cylinder.getMass(), 169.56, accuracy: 0.5)
        XCTAssertEqual(cylinder.getHeight(), 3, accuracy: 0.5)
        XCTAssertEqual(cylinder.getBaseRadius(), 3, accuracy: 0.5)
    }
    
    func testCylinderWithWrongParameters() {
        let cylinder = Cylinder(withDensity: 2, baseRadius: 3, height: 3)
        
        XCTAssertEqual(cylinder.getDensity(), 2, accuracy: 0.5)
        XCTAssertEqual(cylinder.getVolume(), 84.78, accuracy: 0.5)
        XCTAssertEqual(cylinder.getMass(), 169.56, accuracy: 0.5)
        XCTAssertEqual(cylinder.getHeight(), 3, accuracy: 0.5)
        XCTAssertEqual(cylinder.getBaseRadius(), 3, accuracy: 0.5)
    }
    
    // MARK: - Compound -
    func testEmptyCompound() {
        let compound = Compound()
        
        XCTAssertEqual(compound.getDensity(), 0, accuracy: 0.5)
        XCTAssertEqual(compound.getVolume(), 0, accuracy: 0.5)
        XCTAssertEqual(compound.getMass(), 0, accuracy: 0.5)
    }
    
    func testCompound() {
        let sphere = Sphere(withDensity: 10, radius: 1)
        let parallelepiped = Parallelepiped(withDensity: 10, width: 2, height: 3, depth: 4)
        let cone = Cone(withDensity: 5, baseRadius: 3, height: 4)
        let cylinder = Cylinder(withDensity: 2, baseRadius: 3, height: 3)
        
        let compound = Compound()
        XCTAssertTrue(compound.addChieldBody(sphere))
        XCTAssertTrue(compound.addChieldBody(parallelepiped))
        XCTAssertTrue(compound.addChieldBody(cone))
        XCTAssertTrue(compound.addChieldBody(cylinder))
        
        XCTAssertEqual(compound.getDensity(), 4.25, accuracy: 0.5)
        XCTAssertEqual(compound.getVolume(), 150.65, accuracy: 0.5)
        XCTAssertEqual(compound.getMass(), 639.824, accuracy: 0.5)
    }
    
    func testComplexCompound() {
        let sphere = Sphere(withDensity: 10, radius: 1)
        let parallelepiped = Parallelepiped(withDensity: 10, width: 2, height: 3, depth: 4)
        let cone = Cone(withDensity: 5, baseRadius: 3, height: 4)
        let cylinder = Cylinder(withDensity: 2, baseRadius: 3, height: 3)
        
        let compound = Compound()
        XCTAssertTrue(compound.addChieldBody(sphere))
        XCTAssertTrue(compound.addChieldBody(parallelepiped))
        XCTAssertTrue(compound.addChieldBody(cone))
        XCTAssertTrue(compound.addChieldBody(cylinder))
        
        XCTAssertEqual(compound.getDensity(), 4.25, accuracy: 0.5)
        XCTAssertEqual(compound.getVolume(), 150.65, accuracy: 0.5)
        XCTAssertEqual(compound.getMass(), 639.824, accuracy: 0.5)
        
        let complexCompound = Compound()
        let oneMoreParallelepiped = Parallelepiped(withDensity: 1, width: 1, height: 2, depth: 2)
        
        XCTAssertTrue(complexCompound.addChieldBody(compound))
        XCTAssertTrue(complexCompound.addChieldBody(oneMoreParallelepiped))
        
        XCTAssertEqual(oneMoreParallelepiped.getDensity(), 1, accuracy: 0.5)
        XCTAssertEqual(oneMoreParallelepiped.getVolume(), 4, accuracy: 0.5)
        XCTAssertEqual(oneMoreParallelepiped.getMass(), 4, accuracy: 0.5)
        
        XCTAssertEqual(complexCompound.getDensity(), 4.16, accuracy: 0.5)
        XCTAssertEqual(complexCompound.getVolume(), 154.65, accuracy: 0.5)
        XCTAssertEqual(complexCompound.getMass(), 643.824, accuracy: 0.5)
    }
    
    func testCompoundCycle() {
        let a = Compound()
        let b = Compound()
        
        XCTAssertTrue(a.addChieldBody(b))
        XCTAssertFalse(a.addChieldBody(b))
        XCTAssertFalse(b.addChieldBody(a))
    }
    
    func testBigCompoundCycle() {
        let a = Compound()
        let b = Compound()
        let c = Compound()
        let d = Compound()
        let e = Compound()
        let f = Compound()
        
        XCTAssertTrue(a.addChieldBody(b))
        XCTAssertTrue(b.addChieldBody(c))
        XCTAssertTrue(c.addChieldBody(d))
        XCTAssertTrue(d.addChieldBody(e))
        XCTAssertTrue(e.addChieldBody(f))
        XCTAssertFalse(f.addChieldBody(a))
    }
    
    // MARK: - Other usefull things -
    
    // MARK: - Heaviest -
    func testHeaviest() {
        let sphere = Sphere(withDensity: 10, radius: 1)
        let parallelepiped = Parallelepiped(withDensity: 10, width: 2, height: 3, depth: 4)
        let cone = Cone(withDensity: 5, baseRadius: 3, height: 4)
        let cylinder = Cylinder(withDensity: 2, baseRadius: 3, height: 3)
        
        let list: [Body] = [sphere, parallelepiped, cone, cylinder]
        
        let heaviest = getTheHeviestBodyFromList(list)
        
        XCTAssertTrue(heaviest === parallelepiped)
    }
    
    func testHeaviestFromNothing() {
        let list = [Body]()
        
        let heaviest = getTheHeviestBodyFromList(list)
        
        XCTAssertNil(heaviest)
    }
    
    func testHeaviestFromOne() {
        let cone = Cone(withDensity: 5, baseRadius: 3, height: 4)
        let list: [Body] = [cone]
        
        let heaviest = getTheHeviestBodyFromList(list)
        
        XCTAssertTrue(heaviest === cone)
    }
    
    // MARK: - Light -
    func testLight() {
        let sphere = Sphere(withDensity: 10, radius: 1)
        let parallelepiped = Parallelepiped(withDensity: 10, width: 2, height: 3, depth: 4)
        let cone = Cone(withDensity: 5, baseRadius: 3, height: 4)
        let cylinder = Cylinder(withDensity: 2, baseRadius: 3, height: 3)
        
        let list: [Body] = [sphere, parallelepiped, cone, cylinder]
        
        let light = getTheLightWeightInWhaterFromList(list)
        
        XCTAssertTrue(light === cylinder)
    }
    
    func testLightFromNothing() {
        let list = [Body]()
        
        let heaviest = getTheHeviestBodyFromList(list)
        
        XCTAssertNil(heaviest)
    }
    
    func testLightFromOne() {
        let cone = Cone(withDensity: 5, baseRadius: 3, height: 4)
        let list: [Body] = [cone]
        
        let heaviest = getTheHeviestBodyFromList(list)
        
        XCTAssertTrue(heaviest === cone)
    }
}
