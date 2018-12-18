//
//  ViewController.swift
//  Timer
//
//  Created by nxc on 18/11/18.
//  Copyright © 2018年 nxc. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var minSec = 0
    var second = 0
    var min = 0
    var minSecStr: String?
    var secondStr: String?
    var minStr: String?
    var timer: Timer?
    var timeArr = [String]()
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var recordTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        recordTable.delegate = self
        recordTable.dataSource = self
    }
    private func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timeArr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        }
        
        cell?.textLabel?.text = timeArr[indexPath.row]
        
        return cell!
    }
    @IBAction func start(_ sender: Any) {
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: {_ in
            if self.minSec < 99{
                self.minSec = self.minSec + 1
            }else{
                self.minSec = 0
                if self.second < 59{
                    self.second = self.second + 1
                }else{
                    self.second = 0
                    self.min = self.min + 1
                }
            }
            if self.minSec < 10{
                self.minSecStr = "0"+String(self.minSec)
            }else{
                self.minSecStr = String(self.minSec)
            }
            if self.second < 10{
                self.secondStr = "0"+String(self.second)
            }else{
                self.secondStr = String(self.second)
            }
            if self.min < 10{
                self.minStr = "0"+String(self.min)
            }else{
                self.minStr = String(self.min)
            }
            self.timeLabel.text = self.minStr!+":"+self.secondStr!+":"+self.minSecStr!
        });
    }
    @IBAction func record(_ sender: Any) {
        timeArr.insert(timeLabel.text!, at: 0)
        recordTable.reloadData()
    }
    @IBAction func stop(_ sender: Any) {
        timer?.invalidate()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

