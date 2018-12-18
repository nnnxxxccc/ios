//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class MyView:UIView{
    override func draw(_ rect: CGRect) {
        let pathRect = UIEdgeInsetsInsetRect(self.bounds, UIEdgeInsetsMake(1, 1, 1, 1))
        
        let path = UIBezierPath(roundedRect: pathRect, cornerRadius: 10)
        
        path.lineWidth = 4
        
        UIColor.green.setFill()
        UIColor.black.setStroke()
        path.fill()
        path.stroke()
    }
}

var view1 = MyView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
view1.backgroundColor = UIColor.white