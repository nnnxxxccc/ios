//
//  ViewController.swift
//  9.3
//
//  Created by nxc on 18/11/18.
//  Copyright © 2018年 nxc. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate{

    @IBOutlet weak var selectName: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    var names = [String]() {
        didSet {
            UserDefaults.standard.set(names, forKey: "names")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if let arrays = UserDefaults.standard.stringArray(forKey: "names") {
            names = arrays
        }
    }
    // MARK: - Table view data source
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "qq")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "qq")
        }
        
        cell?.textLabel?.text = names[indexPath.row]
        
        return cell!
    }
    
    
    // MARK: - Table view delegate
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            names.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectName.text = names[indexPath.row]
    }
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let name = names.remove(at: sourceIndexPath.row)
        names.insert(name, at: destinationIndexPath.row)
    }
    // MARK: - TextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    @IBAction func add(_ sender: AnyObject) {
        names.append(textField.text!)
        tableView.reloadData()
    }
    @IBAction func edit(_ sender: UIButton) {
        sender.setTitle(tableView.isEditing ? "Edit" : "Done", for: .normal)
        tableView.setEditing(!tableView.isEditing, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

