//
//  ViewController.swift
//  6.3
//
//  Created by nxc on 18/11/18.
//  Copyright © 2018年 nxc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var desLabel: UILabel!

    @IBOutlet weak var display: UILabel!
    var userIsInTheMiddleOfTyping = false
    @IBAction func touchDigit(_ sender: UIButton) {
        desLabel.text = desLabel.text! + sender.currentTitle!
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTyping {
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        }else{
            display.text = digit
        }
        userIsInTheMiddleOfTyping = true
    }
    var displayValue: Double {
        get{
            return Double(display.text!)!
        }
        set{
            display.text = String(newValue)
        }
    }
    private var brain = CalculatorBrain()
    @IBAction func performOperation(_ sender: UIButton) {
        desLabel.text = desLabel.text! + sender.currentTitle!
        if userIsInTheMiddleOfTyping{
            brain.setOperand(operand: displayValue)
            userIsInTheMiddleOfTyping = false
        }
        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperation(symbol: mathematicalSymbol)
        }
        displayValue = brain.result
    }


}

