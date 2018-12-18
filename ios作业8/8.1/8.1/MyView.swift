//
//  MyView.swift
//  8.1
//
//  Created by nxc on 18/11/18.
//  Copyright © 2018年 nxc. All rights reserved.
//

import UIKit

class MyView: UIView {

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
