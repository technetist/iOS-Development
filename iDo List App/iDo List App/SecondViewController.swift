//
//  SecondViewController.swift
//  iDo List App
//
//  Created by Adrien Maranville on 7/28/16.
//  Copyright © 2016 Maranville Designs. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet var userInput: UITextField!
    @IBAction func btnSubmit(sender: AnyObject) {
        toDoList.append(userInput.text!)
        
        userInput.text = ""
        
        NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.userInput.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        userInput.resignFirstResponder()
        return true
    }


}

