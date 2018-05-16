//
//  ViewController.swift
//  LR42
//
//  Created by Marty on 24/04/2018.
//  Copyright © 2018 Marty. All rights reserved.
//

import UIKit

extension UIColor {
    public convenience init?(hexString: String) {
        let r, g, b, a: CGFloat
        
        if hexString.hasPrefix("#") {
            let start = hexString.index(hexString.startIndex, offsetBy: 1)
            let hexColor = String(hexString[start...])
            
            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255
                    
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        
        return nil
    }
}

class ViewController: UIViewController {
    @IBOutlet var field: Field!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    // line
    @IBAction func addLine(_ sender: Any) {
        var startX: UITextField?
        var startY: UITextField?
        var endX  : UITextField?
        var endY  : UITextField?
        var color : UITextField?
        
        func startXf(textField: UITextField!) {
            startX = textField
            startX?.placeholder = "start X"
        }
        
        func startYf(textField: UITextField!) {
            startY = textField
            startY?.placeholder = "start Y"
        }
        
        func endXf(textField: UITextField!) {
            endX = textField
            endX?.placeholder = "end X"
        }
        
        func endYf(textField: UITextField!) {
            endY = textField
            endY?.placeholder = "end Y"
        }
        
        func colorf(textField: UITextField!) {
            color = textField
            color?.placeholder = "color"
        }
        let alert = UIAlertController(title: "Add line", message: "", preferredStyle: .alert)
        
        alert.addTextField(configurationHandler: startXf)
        alert.addTextField(configurationHandler: startYf)
        alert.addTextField(configurationHandler: endXf)
        alert.addTextField(configurationHandler: endYf)
        alert.addTextField(configurationHandler: colorf)
        
        func addHandler(alert: UIAlertAction!) {
            if let startX = Double(startX?.text ?? ""),
               let startY = Double(startY?.text ?? ""),
               let endX = Double(endX?.text ?? ""),
               let endY = Double(endY?.text ?? ""),
               let color = UIColor(hexString: color?.text ?? "") {
                    let line = LineSegment(withStartY: startY, startX: startX, endY: endY, endX: endX, andColor: color)
                    field.addLine(line)
            }
        }
        
        
        let addAction    = UIAlertAction(title: "Add", style: .default, handler: addHandler)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(addAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true)
    }
    
    // triangle
    @IBAction func addTriangle(_ sender: Any) {
        var x1: UITextField?
        var y1: UITextField?
        var x2: UITextField?
        var y2: UITextField?
        var x3: UITextField?
        var y3: UITextField?
        var fillColor   : UITextField?
        var outlineColor: UITextField?
        
        
        func x1f(textField: UITextField!) {
            x1 = textField
            x1?.placeholder = "x1"
        }
        
        func y1f(textField: UITextField!) {
            y1 = textField
            y1?.placeholder = "y1"
        }
        
        func x2f(textField: UITextField!) {
            x2 = textField
            x2?.placeholder = "x2"
        }
        
        func y2f(textField: UITextField!) {
            y2 = textField
            y2?.placeholder = "y2"
        }
        
        func x3f(textField: UITextField!) {
            x3 = textField
            x3?.placeholder = "x3"
        }
        
        func y3f(textField: UITextField!) {
            y3 = textField
            y3?.placeholder = "y3"
        }
        
        func fillColorf(textField: UITextField!) {
            fillColor = textField
            fillColor?.placeholder = "fill color"
        }
        
        func outlineColorf(textField: UITextField!) {
            outlineColor = textField
            outlineColor?.placeholder = "outline color"
        }
        
        let alert = UIAlertController(title: "Add line", message: "", preferredStyle: .alert)
        
        alert.addTextField(configurationHandler: x1f)
        alert.addTextField(configurationHandler: y1f)
        alert.addTextField(configurationHandler: x2f)
        alert.addTextField(configurationHandler: y2f)
        alert.addTextField(configurationHandler: x3f)
        alert.addTextField(configurationHandler: y3f)
        alert.addTextField(configurationHandler: fillColorf)
        alert.addTextField(configurationHandler: outlineColorf)
        
        func addHandler(alert: UIAlertAction!) {
            if let x1 = Double(x1?.text ?? ""),
               let y1 = Double(y1?.text ?? ""),
               let x2 = Double(x2?.text ?? ""),
               let y2 = Double(y2?.text ?? ""),
               let x3 = Double(x3?.text ?? ""),
               let y3 = Double(y3?.text ?? ""),
               let fillColor    = UIColor(hexString: fillColor?.text ?? ""),
               let outlineColor = UIColor(hexString: outlineColor?.text ?? "") {
                    let points = [Point(withY: y1, andX: x1), Point(withY: y2, andX: x2), Point(withY: y3, andX: x3)]
                    let triangle = Triangle(withVertex1: points[0], vertex2: points[1], vertex3: points[2], fillColor: fillColor, andOutlineColor: outlineColor)
                    field.addTriangle(triangle)
            }
        }
        
        
        let addAction    = UIAlertAction(title: "Add", style: .default, handler: addHandler)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(addAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true)
    }
    
    // rectangle
    @IBAction func addRectangle(_ sender: Any) {
        var x: UITextField?
        var y: UITextField?
        var width: UITextField?
        var height: UITextField?
        var fillColor   : UITextField?
        var outlineColor: UITextField?
        
        
        func xf(textField: UITextField!) {
            x = textField
            x?.placeholder = "x"
        }
        
        func yf(textField: UITextField!) {
            y = textField
            y?.placeholder = "y"
        }
        
        func widthf(textField: UITextField!) {
            width = textField
            width?.placeholder = "width"
        }
        
        func heightf(textField: UITextField!) {
            height = textField
            height?.placeholder = "height"
        }
        
        func fillColorf(textField: UITextField!) {
            fillColor = textField
            fillColor?.placeholder = "fill color"
        }
        
        func outlineColorf(textField: UITextField!) {
            outlineColor = textField
            outlineColor?.placeholder = "outline color"
        }
        
        let alert = UIAlertController(title: "Add line", message: "", preferredStyle: .alert)
        
        alert.addTextField(configurationHandler: xf)
        alert.addTextField(configurationHandler: yf)
        alert.addTextField(configurationHandler: widthf)
        alert.addTextField(configurationHandler: heightf)
        alert.addTextField(configurationHandler: fillColorf)
        alert.addTextField(configurationHandler: outlineColorf)
        
        func addHandler(alert: UIAlertAction!) {
            if let x = Double(x?.text ?? ""),
               let y = Double(y?.text ?? ""),
               let width  = Double(width?.text ?? ""),
               let height = Double(height?.text ?? ""),
               let fillColor    = UIColor(hexString: fillColor?.text ?? ""),
               let outlineColor = UIColor(hexString: outlineColor?.text ?? "") {
                let rectangle = Rectangle(withLeftTop: Point(withY: y, andX: x), width: width, height: height, fillColor: fillColor, andOutlineColor: outlineColor)
                field.addRectangle(rectangle)
            }
        }
        
        
        let addAction    = UIAlertAction(title: "Add", style: .default, handler: addHandler)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(addAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true)
    }
    
    // circle
    @IBAction func addCircle(_ sender: Any) {
        var x: UITextField?
        var y: UITextField?
        var radius: UITextField?
        var fillColor   : UITextField?
        var outlineColor: UITextField?
        
        
        func xf(textField: UITextField!) {
            x = textField
            x?.placeholder = "centet x"
        }
        
        func yf(textField: UITextField!) {
            y = textField
            y?.placeholder = "center y"
        }
        
        func radiusf(textField: UITextField!) {
            radius = textField
            radius?.placeholder = "radius"
        }
        
        func fillColorf(textField: UITextField!) {
            fillColor = textField
            fillColor?.placeholder = "fill color"
        }
        
        func outlineColorf(textField: UITextField!) {
            outlineColor = textField
            outlineColor?.placeholder = "outline color"
        }
        
        let alert = UIAlertController(title: "Add line", message: "", preferredStyle: .alert)
        
        alert.addTextField(configurationHandler: xf)
        alert.addTextField(configurationHandler: yf)
        alert.addTextField(configurationHandler: radiusf)
        alert.addTextField(configurationHandler: fillColorf)
        alert.addTextField(configurationHandler: outlineColorf)
        
        func addHandler(alert: UIAlertAction!) {
            if let x = Double(x?.text ?? ""),
               let y = Double(y?.text ?? ""),
               let radius = Double(radius?.text ?? ""),
               let fillColor    = UIColor(hexString: fillColor?.text ?? ""),
               let outlineColor = UIColor(hexString: outlineColor?.text ?? "") {
                    let circle = Circle(withCenter: Point(withY: y, andX: x), radius: radius, fillColor: fillColor, andOutlineColor: outlineColor)
                    field.addCircle(circle)
            }
        }
        
        
        let addAction    = UIAlertAction(title: "Add", style: .default, handler: addHandler)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(addAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true)
    }
}

