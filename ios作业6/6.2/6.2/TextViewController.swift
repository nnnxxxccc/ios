//
//  TextViewController.swift
//  6.2
//
//  Created by nxc on 18/11/18.
//  Copyright © 2018年 nxc. All rights reserved.
//

import UIKit

class TextViewController: UIViewController {
    let height = UIScreen.main.bounds.size.height
    let width = UIScreen.main.bounds.size.width
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var path = Bundle.main.bundleURL
        path.appendPathComponent("test.htm")
        view.backgroundColor = UIColor.white
        let textView = UITextView()
        textView.frame = CGRect(x: 0, y: 20, width: width, height: height-20)
        textView.text = try? String(contentsOf: path)
        view.addSubview(textView)
        
        let backBtn = UIButton(type: .custom)
        backBtn.frame = CGRect(x: Int(width)/2-25, y: 20, width: 50, height: 20)
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
