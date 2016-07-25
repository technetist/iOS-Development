//
//  ViewController.swift
//  Guessing Game
//
//  Created by Adrien Maranville on 7/24/16.
//  Copyright © 2016 Maranville Designs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    

    @IBOutlet var userGuess: UITextField!
    

    @IBOutlet var resultLabel: UILabel!

    @IBAction func Guess(sender: AnyObject) {
        let rand = String(arc4random_uniform(6))
        
        print(rand)
        
        if userGuess.text == rand {
            resultLabel.text = "You guessed right!"
        }
        else {
            resultLabel.text = "Guess again..."
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

