//
//  ViewController.swift
//  Location Info
//
//  Created by Adrien Maranville on 8/21/16.
//  Copyright © 2016 Maranville Designs. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    //Declare label text variables
    @IBOutlet var lblLatitude: UILabel!
    @IBOutlet var lblLongitude: UILabel!
    @IBOutlet var lblCourse: UILabel!
    @IBOutlet var lblSpeed: UILabel!
    @IBOutlet var lblAltitude: UILabel!
    @IBOutlet var lblAddress: UILabel!
    

    var locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation: CLLocation = locations[0]
        
        let latitude = userLocation.coordinate.latitude
        let longitude = userLocation.coordinate.longitude
        lblLatitude.text = String(latitude)
        lblLongitude.text = String(longitude)
        
        let course = userLocation.course
        let speed = userLocation.speed
        lblCourse.text = String(course)
        lblSpeed.text = String(speed)
        
        let altitude = userLocation.altitude
        lblAltitude.text = String(altitude)
        
        
        CLGeocoder().reverseGeocodeLocation(userLocation) { (placemarks, error) in
            if error != nil {
                print(error)
            } else {
                if let placemark = placemarks?[0]{
                    var address = ""
                    
                    
                    if placemark.subThoroughfare != nil {
                        address += placemark.subThoroughfare! + " "
                    }
                    if placemark.thoroughfare != nil {
                        address += placemark.thoroughfare! + "\n"
                    }
                    if placemark.subLocality != nil {
                        address += placemark.subLocality! + "\n"
                    }
                    if placemark.subAdministrativeArea != nil {
                        address += placemark.subAdministrativeArea! + "\n"
                    }
                    if placemark.postalCode != nil {
                        address += placemark.postalCode! + "\n"
                    }
                    if placemark.country != nil {
                        address += placemark.country!
                    }
                    
                    self.lblAddress.text = address
                }
            }
        }
        
    }



}


