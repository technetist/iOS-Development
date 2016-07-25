//
//  ViewController.swift
//  Prime Calculator
//
//  Created by Adrien Maranville on 7/25/16.
//  Copyright © 2016 Maranville Designs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var testNumber: UITextField!
    
    @IBOutlet var resultLabel: UILabel!
    
    @IBAction func isPrime(sender: AnyObject) {
        if let number = Int(testNumber.text!) {
        
            var prime = true
        
            if number == 1 {
                prime = false
            }
        
            if number != 2 && number != 1 {
            
                for i in 2 ..< number {
                    if number % i == 0 {
                        prime = false
                    }
                }
            }
            if prime {
                resultLabel.text = "\(number) is prime!"
            }
            else{
                resultLabel.text = "\(number) is not prime..."
            }
        }
        else {
            resultLabel.text = "Please enter a valid whole number"
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

