
//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by nxc on 18/11/18.
//  Copyright © 2018年 nxc. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func save(_ sender: AnyObject) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        if let person = NSEntityDescription.insertNewObject(forEntityName: "Person", into: context) as? Person {
            person.name = nameField.text
            person.age = Int64(ageField.text!)!
            
            appDelegate.saveContext()
            
            print(NSHomeDirectory())
            
        
        }
        
    }
    @IBAction func list(_ sender: AnyObject) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let predicate = NSPredicate(format: "name like %@", nameField.text!)
        let fetchrequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Person")
        fetchrequest.predicate = predicate
        
        if let result = try? context.fetch(fetchrequest) {
            for p in result as! [Person] {
                print("name:\(p.name!),age:\(p.age)")
                context.delete(p)
                appDelegate.saveContext()

            }
        }
        
        
        
        
    }


}

