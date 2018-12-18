//
//  ViewController.swift
//  8.1
//
//  Created by nxc on 18/11/18.
//  Copyright © 2018年 nxc. All rights reserved.
//

import UIKit
extension MyView{
    func pan(gesture: UIPanGestureRecognizer){
        switch gesture.state {
        case .changed, .ended:
            let translation = gesture.translation(in: self)
            let x = center.x + translation.x
            let y = center.y + translation.y
            center = CGPoint(x: x, y: y)
            gesture.setTranslation(CGPoint.zero, in: self)
        default:
            break
        }
        
    }
    func tap(gesture: UITapGestureRecognizer){
        switch gesture.state {
        case .ended:
            self.removeFromSuperview()
        default:
            break;
        }
    }
    
    func pinch(gesture: UIPinchGestureRecognizer){
        self.transform = CGAffineTransform(scaleX: gesture.scale, y: gesture.scale)
    }
    func rotation(gesture: UIRotationGestureRecognizer){
        self.transform = CGAffineTransform(rotationAngle: gesture.rotation)
    }
}
extension UILabel{
    func pan(gesture: UIPanGestureRecognizer){
        switch gesture.state {
        case .changed, .ended:
            let translation = gesture.translation(in: self)
            let x = center.x + translation.x
            let y = center.y + translation.y
            center = CGPoint(x: x, y: y)
            gesture.setTranslation(CGPoint.zero, in: self)
        default:
            break
        }
    }
    func tap(gesture: UITapGestureRecognizer){
        switch gesture.state {
        case .ended:
            self.removeFromSuperview()
        default:
            break;
        }
    }
}
class ViewController: UIViewController {
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var clearBtn: UIButton!
    @IBOutlet weak var moveBtn: UIButton!
    var lastScaleFactor: CGFloat! = 1
    var myLabel: UILabel?
    var myView: MyView?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myView = MyView(frame: CGRect(x: 100, y: 100, width: view.bounds.width-200, height: 200))
        view.addSubview(myView!);
        
        addBtn.layer.shadowColor = UIColor.black.cgColor
        addBtn.layer.shadowOffset = CGSize(width: 5, height: 5)
        addBtn.layer.shadowOpacity = 1.0
        
        clearBtn.layer.shadowColor = UIColor.black.cgColor
        clearBtn.layer.shadowOffset = CGSize(width: 5, height: 5)
        clearBtn.layer.shadowOpacity = 1.0
        
        moveBtn.layer.shadowColor = UIColor.black.cgColor
        moveBtn.layer.shadowOffset = CGSize(width: 5, height: 5)
        moveBtn.layer.shadowOpacity = 1.0
        
        //拖动
        let panGesture = UIPanGestureRecognizer(target: myView, action: #selector(myView?.pan))
        myView?.addGestureRecognizer(panGesture)
        
        //触摸
        let tapGesture = UITapGestureRecognizer(target: myView, action: #selector(myView?.tap))
        tapGesture.numberOfTapsRequired = 2
        tapGesture.numberOfTouchesRequired = 1
        myView?.addGestureRecognizer(tapGesture)
        
        //缩放
        let pinchGesture = UIPinchGestureRecognizer(target: myView, action: #selector(myView?.pinch))
        myView?.addGestureRecognizer(pinchGesture)
        
        //旋转
        let rotationGesture = UIRotationGestureRecognizer(target: myView, action: #selector(myView?.rotation))
        myView?.addGestureRecognizer(rotationGesture)
    }
    
    
    @IBAction func add(_ sender: Any) {
        let x = Int(arc4random()%UInt32(view.bounds.width-100))
        let y = Int(arc4random()%UInt32(view.bounds.height-20))
        myLabel = UILabel(frame: CGRect(x: x, y: y, width: 100, height: 20))
        myLabel?.text = "hello world"
        myLabel?.textColor = UIColor.blue
        myLabel?.isUserInteractionEnabled = true
        myLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        view.insertSubview(myLabel!, at: 1)
        let panGesture4 = UIPanGestureRecognizer(target: myLabel, action: #selector(myLabel?.pan))
        myLabel?.addGestureRecognizer(panGesture4)
        let tapGesture = UITapGestureRecognizer(target: myLabel, action: #selector(myLabel?.tap))
        tapGesture.numberOfTapsRequired = 2
        tapGesture.numberOfTouchesRequired = 1
        myLabel?.addGestureRecognizer(tapGesture)
    }
    @IBAction func move(_ sender: Any) {
        for label in view.subviews {
            if label is UILabel {
                UILabel.animate(withDuration: 3.0, animations: {
                    let x = Int(arc4random()%UInt32(self.view.bounds.width-100))
                    let y = Int(arc4random()%UInt32(self.view.bounds.height-20))
                    label.frame = CGRect(x: x, y: y, width: 100, height: 20)
                })
            }
        }
    }
    @IBAction func clear(_ sender: Any) {
        for label in view.subviews {
            label.removeFromSuperview()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

