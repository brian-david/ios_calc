//
//  ViewController.swift
//  calculator
//
//  Created by Brian Irons on 2019/10/18.
//  Copyright © 2019 Brian Irons. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var ansLbl : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnPress(sender: RoundButton){
        if sender.tag >= 0 && sender.tag <= 9{
            ansLbl.text = String(sender.tag)
        }
    }
}

