//
//  ViewController.swift
//  iWeather
//
//  Created by Adrien Maranville on 8/7/16.
//  Copyright © 2016 Maranville Designs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var txtBoxUserCity: UITextField!
    
    @IBOutlet var lblResult: UILabel!
    
    @IBAction func btnSubmit(_ sender: AnyObject) {

        if txtBoxUserCity.text != "" {
            if let url = URL(string: "http://www.weather-forecast.com/locations/" + txtBoxUserCity.text!.replacingOccurrences(of: " ", with: "-") + "/forecasts/latest"){
                
                let request = NSMutableURLRequest(url: url)
                let task = URLSession.shared.dataTask(with: request as URLRequest){
                    data, response, error in
                    
                    var message = ""
                    
                    if error != nil {
                        print(error)
                    } else{
                        if let unwrappedData = data {
                            let dataString = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue)
                            var stringSeperator = "Weather Forecast Summary:</b><span class=\"read-more-small\"><span class=\"read-more-content\"> <span class=\"phrase\">"
                            if let contentArray = dataString?.components(separatedBy: stringSeperator) {
                                if contentArray.count > 1 {
                                    stringSeperator = "</span>"
                                    let newContentArray = contentArray[1].components(separatedBy: stringSeperator)
                                    if newContentArray.count > 1 {
                                        message = newContentArray[0].replacingOccurrences(of: "&deg;", with: "°")
                                        print(message)
                                    }
                                }
                            }
                        }
                    }
                    if message == "" {
                        message = "The Weather couldn't be found"
                    }
                    DispatchQueue.main.sync(execute: {
                        self.lblResult.text = message
                    })
                }
                task.resume()

            }
        }
        else {
            lblResult.text = "Please enter a city."
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

