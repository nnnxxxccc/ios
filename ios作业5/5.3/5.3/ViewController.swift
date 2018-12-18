//
//  ViewController.swift
//  5.3
//
//  Created by nxc on 18/11/18.
//  Copyright © 2018年 nxc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var myLabel:UILabel?
    override func viewDidLoad() {
        super.viewDidLoad()
        myLabel = UILabel()
        myLabel?.frame = CGRect(x: self.view.frame.size.width/2-50, y: 100, width: 100, height: 50)
        myLabel?.text = "Hello,world"
        myLabel?.textAlignment = NSTextAlignment.center
        self.view.addSubview(myLabel!)
        let myBtn = UIButton()
        myBtn.frame = CGRect(x: self.view.frame.size.width/2-50, y: 200, width: 100, height: 50)
        myBtn.tag = 100
        myBtn.setTitle("Click me", for: UIControlState.normal)
        myBtn.setTitleColor(UIColor.red, for: UIControlState.normal)

        self.view.addSubview(myBtn)
        myBtn.addTarget(self, action: #selector(ViewController.click), for: UIControlEvents.touchUpInside)
        // Do any additional setup after loading the view, typically from a nib.
    }
    func click(btn:UIButton){
        print(btn.tag)
        myLabel?.text = "Hi,world"
        myLabel?.textColor = UIColor.blue
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

