//
//  SinViewController.swift
//  6.2
//
//  Created by nxc on 18/11/18.
//  Copyright © 2018年 nxc. All rights reserved.
//

import UIKit

class SinViewController: UIViewController {
    let height = UIScreen.main.bounds.size.height
    let width = UIScreen.main.bounds.size.width
    var myView:MyView?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        myView = MyView()
        myView?.frame = CGRect(x: Int(width)/2 - 200, y: 100, width: 400, height: 400)
        view.addSubview(myView!)
        myView?.backgroundColor = UIColor.white
        
        let backBtn = UIButton(type: .custom)
        backBtn.frame = CGRect(x: Int(width)/2-25, y: 20, width: 50, height: 20)
        backBtn.setTitle("Back", for: .normal)
        backBtn.setTitleColor(UIColor.red, for: .normal)
        view.addSubview(backBtn)
        
        backBtn.addTarget(self, action: #selector(Back), for: .touchUpInside)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        myView?.myfun = { sin($0) }
    }
    
    func Back(btn:UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
