//
//  ImgViewController.swift
//  6.2
//
//  Created by nxc on 18/11/18.
//  Copyright © 2018年 nxc. All rights reserved.
//

import UIKit

class ImgViewController: UIViewController {
    let height = UIScreen.main.bounds.size.height
    let width = UIScreen.main.bounds.size.width
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        let img = UIImage(named: "Rectangle 313@3x.png")
        let imgView = UIImageView(image: img)
        imgView.frame = CGRect(x: 0, y: 0, width: width, height: height)
        view.addSubview(imgView)
        
        let backBtn = UIButton(type: .custom)
        backBtn.frame = CGRect(x: 10, y: 20, width: 50, height: 20)
        backBtn.setTitle("Back", for: .normal)
        backBtn.setTitleColor(UIColor.red, for: .normal)
        view.addSubview(backBtn)
        
        backBtn.addTarget(self, action: #selector(Back), for: .touchUpInside)
    }

    func Back(btn:UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
