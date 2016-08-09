//
//  ViewController.swift
//  Cat Years (iOS 10)
//
//  Created by Adrien Maranville on 7/29/16.
//  Copyright © 2016 Maranville Designs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var txtBoxYears: UITextField!
    @IBOutlet var lblResult: UILabel!
    @IBAction func btnConvert(_ sender: AnyObject) {
        if !txtBoxYears.text!.isEmpty {
            let convertedYears = Int(txtBoxYears.text!)! * 7
        lblResult.text = "Your cat is \(convertedYears) years old, in cat years"
        }
        else {
            lblResult.text = "Please enter a number above"
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

