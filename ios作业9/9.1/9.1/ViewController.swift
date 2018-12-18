//
//  ViewController.swift
//  9.1
//
//  Created by nxc on 18/11/18.
//  Copyright © 2018年 nxc. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var textView: UITextView!

    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notificaiton:)), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notificaiton:)), name: .UIKeyboardWillHide, object: nil)
        
    }

    @IBAction func actionSheet(_ sender: Any) {
        let actionSheet = UIAlertController(title: "Change Color", message: "You can change backgroundColor", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "red", style: .default, handler: { (action: UIAlertAction) in
            self.view.backgroundColor = UIColor.red
        }))
        actionSheet.addAction(UIAlertAction(title: "blue", style: .default, handler: { (action: UIAlertAction) in
            self.view.backgroundColor = UIColor.blue
        }))
        actionSheet.addAction(UIAlertAction(title: "yellow", style: .default, handler: { (action: UIAlertAction) in
            self.view.backgroundColor = UIColor.yellow
        }))
        actionSheet.addAction(UIAlertAction(title: "purple", style: .default, handler: { (action: UIAlertAction) in
            self.view.backgroundColor = UIColor.purple
        }))
        actionSheet.addAction(UIAlertAction(title: "green", style: .default, handler: { (action: UIAlertAction) in
            self.view.backgroundColor = UIColor.green
        }))
        actionSheet.addAction(UIAlertAction(title: "gray", style: .default, handler: { (action: UIAlertAction) in
            self.view.backgroundColor = UIColor.gray
        }))
        actionSheet.addAction(UIAlertAction(title: "clear", style: .destructive, handler: { (action: UIAlertAction) in
            self.view.backgroundColor = UIColor.clear
        }))
        present(actionSheet, animated: true, completion: nil)
    }
    @IBAction func alert(_ sender: Any) {
        let alert = UIAlertController(title: "Login Alert", message: "This is Alert", preferredStyle: .alert)
        alert.addTextField { (textField: UITextField) in
            textField.placeholder = "userName"
        }
        alert.addTextField { (textField: UITextField) in
            textField.placeholder = "password"
            textField.isSecureTextEntry = true
        }
        alert.addAction(UIAlertAction(title: "确定", style: .default, handler: { (alertaction: UIAlertAction) in
            if let username = alert.textFields?[0]{
                print("\(username.text!)")
            }
            if let password = alert.textFields?[1]{
                print("\(password.text!)")
            }
        }))
        alert.addAction(UIAlertAction(title: "取消", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    func keyboardWillShow(notificaiton: Notification) {
        if let userinfo = notificaiton.userInfo {
            if let rect = (userinfo[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
                print(rect)
                if textField.isFirstResponder {
                    UIView.animate(withDuration: 2, animations: {
                        self.view.frame.origin.y = -rect.height
                    })
                }
            }
        }
    }
    func keyboardWillHide(notificaiton: Notification) {
        UIView.animate(withDuration: 2) {
            self.view.frame.origin.y = 0
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textView.resignFirstResponder()
        textField.resignFirstResponder()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

