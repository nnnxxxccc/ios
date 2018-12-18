//
//  ViewController.swift
//  HttpDemo
//
//  Created by nxc on 18/11/18.
//  Copyright © 2018年 nxc. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBAction func loadImage(_ sender: AnyObject) {
        DispatchQueue.global().async {
            let url = URL(string: "http://10.0.1.2/pic.php?id=1")
            if let data = try? Data(contentsOf: url!) {
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(data: data)
                }
            }
        }
    }
    
    @IBOutlet weak var imageView2: UIImageView!
 
    @IBAction func loadImage2(_ sender: AnyObject) {
        let url = URL(string: "http://10.0.1.2/pic.php?id=2")
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            DispatchQueue.main.async {
                self.imageView2.image = UIImage(data: data!)
            }
        }
        task.resume()
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

