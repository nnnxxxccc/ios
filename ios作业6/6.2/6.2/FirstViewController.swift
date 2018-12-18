//
//  ViewController.swift
//  6.2
//
//  Created by nxc on 18/11/18.
//  Copyright © 2018年 nxc. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    let height = UIScreen.main.bounds.size.height
    let width = UIScreen.main.bounds.size.width
    var myLabel:UILabel?
    var index = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        myLabel = UILabel()
        myLabel?.frame = CGRect(x: Int(width)/2-50, y: 100, width: 100, height: 50)
        myLabel?.text = "Hello world!"
        myLabel?.textAlignment = NSTextAlignment.center
        myLabel?.textColor = UIColor.black
        view.addSubview(myLabel!)
        
        let clickBtn = UIButton(type: .custom)
        clickBtn.frame = CGRect(x: Int(width)/2-50, y: 200, width: 100, height: 50)
        clickBtn.tag = 1001
        clickBtn.setTitle("Click", for: .normal)
        clickBtn.setTitleColor(UIColor.red, for: UIControlState.normal)
        view.addSubview(clickBtn)
        
        let toImgBtn = UIButton(type: .custom)
        toImgBtn.frame = CGRect(x: Int(width)/2-50, y: 300, width: 100, height: 50)
        toImgBtn.tag = 1002
        toImgBtn.setTitle("toImg", for: .normal)
        toImgBtn.setTitleColor(UIColor.red, for: UIControlState.normal)
        view.addSubview(toImgBtn)
        
        let toTextBtn = UIButton(type: .custom)
        toTextBtn.frame = CGRect(x: Int(width)/2-50, y: 400, width: 100, height: 50)
        toTextBtn.tag = 1003
        toTextBtn.setTitle("toText", for: .normal)
        toTextBtn.setTitleColor(UIColor.red, for: UIControlState.normal)
        view.addSubview(toTextBtn)
        
        let toMyViewBtn = UIButton(type: .custom)
        toMyViewBtn.frame = CGRect(x: Int(width)/2-50, y: 500, width: 100, height: 50)
        toMyViewBtn.tag = 1004
        toMyViewBtn.setTitle("toMyView", for: .normal)
        toMyViewBtn.setTitleColor(UIColor.red, for: UIControlState.normal)
        view.addSubview(toMyViewBtn)
        
        clickBtn.addTarget(self, action: #selector(Click), for: .touchUpInside)
        toImgBtn.addTarget(self, action: #selector(Click), for: .touchUpInside)
        toTextBtn.addTarget(self, action: #selector(Click), for: .touchUpInside)
        toMyViewBtn.addTarget(self, action: #selector(Click), for: .touchUpInside)
    }

    func Click(btn:UIButton) {
        switch btn.tag {
        case 1001:
            switch index {
            case 0:
                myLabel?.text = "Clicked!"
                index = 1
            case 1:
                myLabel?.text = "Hello world!"
                index = 0
            default:
                print("default!")
            }
        case 1002:
            let imgViewController = ImgViewController()
            present(imgViewController, animated: true, completion: nil)
        case 1003:
            let textViewController = TextViewController()
            present(textViewController, animated: true, completion: nil)
        case 1004:
            let sinViewController = SinViewController()
            self.present(sinViewController, animated: true, completion: nil)
        default:
            print("Default")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

