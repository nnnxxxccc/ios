//
//  DetailViewController.swift
//  HttpDemo
//
//  Created by nxc on 18/11/18.
//  Copyright © 2018年 nxc. All rights reserved.
//

import UIKit
import Alamofire

class DetailViewController: UIViewController {

    var person: [String:String]?
    var basePath = "http://10.0.1.2/"

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let person = person {
            nameLabel.text = person["stuName"]!
            let path = person["imagePath"]!
            let imageURL = URL(string: "\(basePath)\(path)")
            Alamofire.request(imageURL!).responseData(completionHandler: { (response) in
                self.imageView.image = UIImage(data: response.result.value!)
            })
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
