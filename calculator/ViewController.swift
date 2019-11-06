//
//  ViewController.swift
//  calculator
//
//  Created by Brian Irons on 2019/10/18.
//  Copyright © 2019 Brian Irons. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen:Double = 0
    var firstNum:Double = 0
    var doingMaths = false
    var operand = 0;
    

    @IBOutlet weak var ansLbl : UILabel!
    @IBOutlet var equationLbl : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func numberPress(sender: RoundButton){
        if doingMaths == true{
            ansLbl.text = String(sender.tag)
            numberOnScreen = Double(ansLbl.text!)!
            doingMaths = false
        }else{
            ansLbl.text = ansLbl.text! + String(sender.tag)
            numberOnScreen = Double(ansLbl.text!)!
        }
    }
    
    @IBAction func operatorPress(_ sender: RoundButton) {
       //check that there is a number input and check that it is actually an operator button
        if ansLbl.text != "" && sender.tag < 15 && sender.tag > 10{
            operand = sender.tag
            firstNum = Double(ansLbl.text!)!
            doingMaths = true
            //Find what button was pressed
            switch (sender.tag){
            case 11: //multiply
                equationLbl.text = String(numberOnScreen)+" x "
                print("multiply")
                ansLbl.text = ""
                break;
            case 12: //divide
                equationLbl.text = String(numberOnScreen)+" ÷ "
                ansLbl.text = ""
                break;
            case 13: //add
                equationLbl.text = String(numberOnScreen)+" + "
                ansLbl.text = ""
                break;
            case 14: //minus
                equationLbl.text = String(numberOnScreen)+" - "
                ansLbl.text = ""
                break;
            default: break
            }
        }
        
        //IF THE BUTTON PRESSED IS =
        else if sender.tag == 15{
            print(operand)
            print("FIRST NUM -> "+String(firstNum))
            print(numberOnScreen)
            switch(operand){
                case 11:
                    equationLbl.text = String(firstNum)+" x "+String(numberOnScreen)
                    ansLbl.text = String(firstNum * numberOnScreen)
                    numberOnScreen = Double(ansLbl.text!)!
                    break
                case 12:
                    equationLbl.text = String(firstNum)+" ÷ "+String(numberOnScreen)
                    ansLbl.text = String(firstNum / numberOnScreen)
                    numberOnScreen = Double(ansLbl.text!)!
                    break;
                case 13:
                    equationLbl.text = String(firstNum)+" + "+String(numberOnScreen)
                    ansLbl.text = String(firstNum + numberOnScreen)
                    numberOnScreen = Double(ansLbl.text!)!
                    break;
                case 14:
                    equationLbl.text = String(firstNum)+" - "+String(numberOnScreen)
                    ansLbl.text = String(firstNum - numberOnScreen)
                    numberOnScreen = Double(ansLbl.text!)!
                    break;
                default: break
            }
        }
        else if (sender.tag == -3){
            equationLbl.text = ""
            ansLbl.text = ""
            firstNum = 0;
            numberOnScreen = 0;
            operand = 0;
        }
    }
    
    @IBAction func memoryFunctions(_ sender: RoundButton){
        if (sender.tag == -4){ //MEMORY CLEAR
            let dictionary = UserDefaults.standard.dictionaryRepresentation()
            dictionary.keys.forEach{key in
                UserDefaults.standard.removeObject(forKey: "memory")
            }
        }else if (sender.tag == -5){ //MEMORY RECALL
            if let memAns = UserDefaults.standard.string(forKey: "memory"){
                print(memAns)
                ansLbl.text = memAns
            }
        }else if (sender.tag == -6){ //MEMORY SAVE
            UserDefaults.standard.set(ansLbl.text, forKey: "memory")
        }
    }
}

//while not = pressed keep adding things to the calculation stack
//if the float is .00 then round to the nearest whole
