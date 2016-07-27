//
//  ViewController.swift
//  Times Table App
//
//  Created by Adrien Maranville on 7/26/16.
//  Copyright © 2016 Maranville Designs. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet var timesNum: UILabel!
    @IBOutlet var sliderValue: UISlider!
    
    @IBOutlet var table: UITableView!
    
    @IBAction func sliderMove(sender: AnyObject) {
        let roundedNum = Int(sliderValue.value * 20)
        timesNum.text = "Showing multiples of \(roundedNum)"
        table.reloadData()
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        cell.textLabel?.textAlignment = NSTextAlignment.Center
        let timesTable = Int(sliderValue.value * 20)
        cell.textLabel?.text = String(timesTable * (indexPath.row + 1))
        
        return cell
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

