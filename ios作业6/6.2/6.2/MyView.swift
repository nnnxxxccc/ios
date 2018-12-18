//
//  MyView.swift
//  6.2
//
//  Created by nxc on 18/11/18.
//  Copyright © 2018年 nxc. All rights reserved.
//

import UIKit

class MyView: UIView {
    var myfun: ((Double)->Double)? {
        didSet{
            setNeedsDisplay()
        }
    }
    
    override func draw(_ rect: CGRect) {
        if let fun = myfun {
            let path = UIBezierPath()
            path.move(to: CGPoint(x: 0, y: Int(rect.height) - 50))
            var x = 0.0
            while x<=Double(rect.width) {
                let y = (fun(Double(x)))*50
                let h = x*50
                path.addLine(to: CGPoint(x: Double(h), y: Double(rect.height) - y - 50))
                x = x + 0.0001
            }
            UIColor.red.setStroke()
            path.stroke()
        }
    }

}
