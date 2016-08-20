//
//  ViewController.swift
//  iGif
//
//  Created by Adrien Maranville on 8/18/16.
//  Copyright © 2016 Maranville Designs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var image: UIImageView!
    
    @IBOutlet var btnStart: UIButton!
    
    var counter = 1
    
    var isAnimated = false
    
    var timer = Timer()
    func animate() {
        image.image = UIImage(named: "frame_\(counter)_delay-0.1s.gif")
        
        counter += 1
        
        if counter == 12 {
            counter = 0
        }
    }
    
    @IBAction func btnStart(_ sender: AnyObject) {
        if isAnimated {
            timer.invalidate()
            btnStart.setTitle("Start Animation", for:[])
            isAnimated = false
        } else{
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.animate), userInfo: nil, repeats: true)
            
            btnStart.setTitle("Stop Animation", for: [])
            
            isAnimated = true
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

