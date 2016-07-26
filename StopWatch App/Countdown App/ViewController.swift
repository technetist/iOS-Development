//
//  ViewController.swift
//  Countdown App
//
//  Created by Adrien Maranville on 7/25/16.
//  Copyright © 2016 Maranville Designs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var timer = NSTimer()
    var time = 0

    @IBOutlet var timerCount: UILabel!
    
    @IBOutlet var btnStart: UIBarButtonItem!
    
    @IBAction func btnStart(sender: AnyObject) {
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController.increment), userInfo: nil, repeats: true)
        btnStart.enabled = false

    }
    
    @IBAction func btnPause(sender: AnyObject) {
        timer.invalidate()
        btnStart.enabled = true
    }
    @IBAction func btnStop(sender: AnyObject) {
        timer.invalidate()
        
        time = 0
        
        timerCount.text = "00:00:00"
        btnStart.enabled = true
    }
    func increment(){
        time += 1
        let (h, m, s) = secondsToHours(time)
        
        timerCount.text = String(format: "%02d", h) + ":" + String(format: "%02d", m) + ":" + String(format: "%02d", s)
    }
    func secondsToHours(seconds: Int)->(Int, Int, Int) {
        
        return (seconds / 3600, (seconds % 3600) / 60 , (seconds % 3600) % 60)
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

