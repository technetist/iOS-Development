//
//  ViewController.swift
//  iFoundYou
//
//  Created by Adrien Maranville on 8/21/16.
//  Copyright © 2016 Maranville Designs. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet var map: MKMapView!
    
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
        
        let latDeleta: CLLocationDegrees = 0.1
        let lonDelta: CLLocationDegrees = 0.1
        
        let span = MKCoordinateSpan(latitudeDelta: latDeleta, longitudeDelta: lonDelta)
        
        let coordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        let region = MKCoordinateRegion(center: coordinates, span: span)
        map.setRegion(region, animated: true)
        
    }


}

