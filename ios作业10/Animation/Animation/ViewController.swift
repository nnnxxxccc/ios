//
//  ViewController.swift
//  Animation
//
//  Created by nxc on 18/11/18.
//  Copyright © 2018年 nxc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var testView:UIView?
    var testView2:UIView?
    override func viewDidLoad() {
        super.viewDidLoad()
        testView = UIView()
        testView?.frame = CGRect(x: 20, y: 20, width: 100, height: 100)
        testView?.backgroundColor = UIColor.red
        view.addSubview(testView!);
        testView2 = UIView()
        testView2?.frame = CGRect(x: 20, y: 20, width: 100, height: 100)
        testView2?.backgroundColor = UIColor.blue
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func animation(_ sender: Any) {
        UIView.animate(withDuration: 3.0, animations: {
            self.testView?.frame = CGRect(x: 100, y: 100, width: 300, height: 300)
            self.testView?.transform = CGAffineTransform(rotationAngle: CGFloat(-M_PI/4))
        });
    }
    @IBAction func transition(_ sender: Any) {
        //改变背景颜色
//        UIView.transition(with: testView!, duration: 1.0, options: .transitionFlipFromLeft, animations: {
//            self.testView?.backgroundColor = UIColor.blue
//        }, completion: nil)
        UIView.transition(from: testView!, to: testView2!, duration: 2.0, options: .transitionFlipFromLeft, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

