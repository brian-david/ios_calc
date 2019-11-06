//
//  ViewController.swift
//  calculator
//
//  Created by Brian Irons on 2019/10/18.
//  Copyright © 2019 Brian Irons. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen:Double = 0;
    var firstNum:Double = 0;
    var secondNum:Double = 0;
    var ans:Double = 0;
    var equals:Bool = false;
    var operand:Bool = false;
    var currentVal:Double = 0.0;
    var action:String? = nil;

    @IBOutlet var ansLbl : UILabel!
    @IBOutlet var equationLbl : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnPress(sender: RoundButton){
        if sender.tag > 0 && sender.tag <= 9{
            if (currentVal == 0){
                currentVal = Double(sender.tag)
                ansLbl.text = ansLbl.text! + String(sender.tag)
            }
            else{
                firstNum = currentVal
                currentVal = Double(sender.tag)
                ansLbl.text =  String(sender.tag)
                equationLbl.text = String(firstNum)+action!+String(currentVal)
            }
        }
    }
    
    @IBAction func operands(_ sender: RoundButton) {
        if (sender.tag != 15){
            switch sender.tag{
            case 11:
                ansLbl.text = "x"
                action = "X"
                ansLbl.text =  String(firstNum)
            case 12:
                ansLbl.text = "÷"
                action = "÷"
                ansLbl.text =  String(firstNum)
            case 13:
                ansLbl.text = "+"
                action = "+"
                ansLbl.text =  String(firstNum)
            case 14:
                ansLbl.text = "-"
                action = "-"
                ansLbl.text =  String(firstNum)
            case 15:
                ansLbl.text = "="
                action = "="
                ansLbl.text = String(firstNum)+action!+String(currentVal)
            default:
                ansLbl.text = ""
            }
        }
        
        if (sender.tag == 15){
            switch action {
            case "X":
                ansLbl.text = String(firstNum * currentVal)
            case "÷":
                ansLbl.text = String(firstNum / currentVal)
            case "+":
                ansLbl.text = String(firstNum + currentVal)
            case "-":
                ansLbl.text = String(firstNum - currentVal)
            default:
                ansLbl.text = ""
            }
        }
    }
}

//while not = pressed keep adding things to the calculation stack
//if the float is .00 then round to the nearest whole
