//
//  ViewController.swift
//  calculator
//
//  Created by Brian Irons on 2019/10/18.
//  Copyright © 2019 Brian Irons. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen:Float = 0;

    @IBOutlet var ansLbl : UILabel!
    @IBOutlet var equationLbl : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnPress(sender: RoundButton){
        if sender.tag > 0 && sender.tag <= 9{
            ansLbl.text = ansLbl.text! + String(sender.tag)
        }
        numberOnScreen = Float(ansLbl.text!)!
    }
    
    @IBAction func operands(_ sender: RoundButton) {
        if ansLbl.text != "" && sender.tag != 15{
            switch sender.tag{
            case 11:
                ansLbl.text = "x"
                case 12:
                ansLbl.text = "÷"
                case 13:
                ansLbl.text = "+"
                case 14:
                ansLbl.text = "-"
                case 15:
                ansLbl.text = "="
            default:
                ansLbl.text = ""
            }
        }
    }
    
}

