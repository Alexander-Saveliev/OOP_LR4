//
//  LR42Tests.swift
//  LR42Tests
//
//  Created by Marty on 24/04/2018.
//  Copyright © 2018 Marty. All rights reserved.
//

import XCTest
@testable import LR42

class LR42Tests: XCTestCase {
    func testLine() {
        let line = LineSegment(withStartY: 0, startX: 0, endY: 3, endX: 4, andColor: UIColor.red)
        
        XCTAssertEqual(line.getStartPoint().x, 0, accuracy: 0.05)
        XCTAssertEqual(line.getStartPoint().y, 0, accuracy: 0.05)
        XCTAssertEqual(line.getEndPoint().x, 4, accuracy: 0.05)
        XCTAssertEqual(line.getEndPoint().y, 3, accuracy: 0.05)
        XCTAssertEqual(line.getOutlineColor(), UIColor.red)
        
        XCTAssertEqual(line.getArea(), 0, accuracy: 0.05)
        XCTAssertEqual(line.getPerimeter(), 5, accuracy: 0.05)
    }
    
    func testTriangle() {
        let triangle = Triangle(withVertex1: Point(withY: 0, andX: 0),
                                vertex2: Point(withY: 3, andX: 0),
                                vertex3: Point(withY: 0, andX: 4),
                                fillColor: UIColor.red,
                                andOutlineColor: UIColor.white)
        
        XCTAssertEqual(triangle.getArea(), 6, accuracy: 0.05)
        XCTAssertEqual(triangle.getPerimeter(), 12, accuracy: 0.05)
        XCTAssertEqual(triangle.getOutlineColor(), UIColor.white)
        XCTAssertEqual(triangle.getFillColor(), UIColor.red)
    }
    
    func testAntiTriangle() {
        let triangle = Triangle(withVertex1: Point(withY: 0, andX: 0),
                                vertex2: Point(withY: -3, andX: 0),
                                vertex3: Point(withY: 0, andX: -4),
                                fillColor: UIColor.red,
                                andOutlineColor: UIColor.white)
        
        XCTAssertEqual(triangle.getArea(), 6, accuracy: 0.05)
        XCTAssertEqual(triangle.getPerimeter(), 12, accuracy: 0.05)
        XCTAssertEqual(triangle.getOutlineColor(), UIColor.white)
        XCTAssertEqual(triangle.getFillColor(), UIColor.red)
    }
    
    func testRectangle() {
        let rectangle = Rectangle(withLeftTop: Point(withY: 0, andX: 0), width: 10, height: 5, fillColor: UIColor.green, andOutlineColor: UIColor.red)
        
        XCTAssertEqual(rectangle.getWidth(), 10, accuracy: 0.05)
        XCTAssertEqual(rectangle.getHeight(), 5, accuracy: 0.05)
        XCTAssertEqual(rectangle.getLeftTop().y, 0, accuracy: 0.05)
        XCTAssertEqual(rectangle.getLeftTop().x, 0, accuracy: 0.05)
        XCTAssertEqual(rectangle.getFillColor(), UIColor.green)
        XCTAssertEqual(rectangle.getOutlineColor(), UIColor.red)
        XCTAssertEqual(rectangle.getArea(), 50, accuracy: 0.05)
        XCTAssertEqual(rectangle.getPerimeter(), 30, accuracy: 0.05)
    }
    
    func testAntiRectangle() {
        let rectangle = Rectangle(withLeftTop: Point(withY: -5, andX: -5), width: -10, height: -5, fillColor: UIColor.green, andOutlineColor: UIColor.red)
        
        XCTAssertEqual(rectangle.getWidth(), 10, accuracy: 0.05)
        XCTAssertEqual(rectangle.getHeight(), 5, accuracy: 0.05)
        XCTAssertEqual(rectangle.getLeftTop().y, -5, accuracy: 0.05)
        XCTAssertEqual(rectangle.getLeftTop().x, -5, accuracy: 0.05)
        XCTAssertEqual(rectangle.getFillColor(), UIColor.green)
        XCTAssertEqual(rectangle.getOutlineColor(), UIColor.red)
        XCTAssertEqual(rectangle.getArea(), 50, accuracy: 0.05)
        XCTAssertEqual(rectangle.getPerimeter(), 30, accuracy: 0.05)
    }
    
    func testCircle() {
        let circle = Circle(withCenter: Point(withY: 10, andX: 3), radius: 5, fillColor: UIColor.red, andOutlineColor: UIColor.green)
        
        XCTAssertEqual(circle.getFillColor(), UIColor.red)
        XCTAssertEqual(circle.getOutlineColor(), UIColor.green)
        
        XCTAssertEqual(circle.getCenter().y, 10, accuracy: 0.05)
        XCTAssertEqual(circle.getCenter().x, 3, accuracy: 0.05)
        XCTAssertEqual(circle.getRadius(), 5, accuracy: 0.05)
        XCTAssertEqual(circle.getPerimeter(), 31.4, accuracy: 0.05)
        XCTAssertEqual(circle.getArea(), 78.5, accuracy: 0.05)
    }
}
