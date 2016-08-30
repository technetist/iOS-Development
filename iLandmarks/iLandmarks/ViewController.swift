//
//  ViewController.swift
//  iLandmarks
//
//  Created by Adrien Maranville on 8/28/16.
//  Copyright © 2016 Maranville Designs. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet var map: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let uilpgr = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longpress(gestureRecognizer:)))
        
        uilpgr.minimumPressDuration = 2
        
        map.addGestureRecognizer(uilpgr)
        
        if activePlace != -1 {
            //Get place details to display on map
            if places.count > activePlace {
                if let name = places[activePlace]["name"] {
                    if let lat = places[activePlace]["lat"] {
                        if let lon = places[activePlace]["lon"] {
                            if let latitude = Double(lat) {
                                if let longitude = Double(lon) {
                                    let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                                    let coordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
                                    let region = MKCoordinateRegion(center: coordinates, span: span)
                                    self.map.setRegion(region, animated: true)
                                    let annotation = MKPointAnnotation()
                                    annotation.coordinate = coordinates
                                    
                                    annotation.title = name
                                    
                                    self.map.addAnnotation(annotation)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    func longpress(gestureRecognizer: UIGestureRecognizer) {
        print("Long press")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

