//
//  ViewController.swift
//  hello
//
//  Created by nxc on 18/11/18.
//  Copyright © 2018年 nxc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myLabel: UILabel!
    var flag:Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myLabel.text = "Hi, world"
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func click(_ sender: AnyObject) {
        if flag == 0 {
            self.myLabel.text = "Hello, world"
            self.myLabel.textColor = UIColor.red
            flag = 1
        }else{
            self.myLabel.text = "Hi, world"
            self.myLabel.textColor = UIColor.black
            flag = 0
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

