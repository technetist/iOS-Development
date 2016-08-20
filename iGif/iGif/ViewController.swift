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
    
    //animation function, delays the image and queues the next
    func animate() {
        image.image = UIImage(named: "frame_\(counter)_delay-0.1s.gif")
        
        counter += 1
        
        if counter == 12 {
            counter = 0
        }
    }
    
    //starts the animation based on a timer
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
    
    //Tool bar buttons to change animation type
    @IBAction func btnFadeIn(_ sender: AnyObject) {
        image.alpha = 0
        
        UIView.animate(withDuration: 1, animations: {
            self.image.alpha = 1
            })
    }
    @IBAction func btnSlideIn(_ sender: AnyObject) {
        image.center = CGPoint(x: image.center.x - 500, y: image.center.y)
        
        UIView.animate(withDuration: 2) {
            self.image.center = CGPoint(x:self.image.center.x + 500, y: self.image.center.y)
        }
    }
    @IBAction func btnGrow(_ sender: AnyObject) {
        image.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        
        UIView.animate(withDuration: 1){
                self.image.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
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

