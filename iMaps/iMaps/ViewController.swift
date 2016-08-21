//
//  ViewController.swift
//  iMaps
//
//  Created by Adrien Maranville on 8/20/16.
//  Copyright © 2016 Maranville Designs. All rights reserved.
//

import UIKit
import UIKit
import MapKit

class ViewController: UIViewController {

    
    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let latitude: CLLocationDegrees = 29.735496
        let longitude: CLLocationDegrees = -95.393246
        let latDelta: CLLocationDegrees = 0.02
        let lonDelta: CLLocationDegrees = 0.02
        
        let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
        
        let coordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        let region = MKCoordinateRegion(center: coordinates, span: span)
        
        mapView.setRegion(region, animated: true)
        
        //annotations
        let annotaion = MKPointAnnotation()
        annotaion.title = "My First Home"
        annotaion.subtitle = "We moved in 2009"
        annotaion.coordinate = coordinates
        mapView.addAnnotation(annotaion)
        
        //long press
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longpress(gestureRecognizer:)))
        longPress.minimumPressDuration = 2
        mapView.addGestureRecognizer(longPress)
        
        
    }

    func longpress(gestureRecognizer: UIGestureRecognizer){
        let touchpoint = gestureRecognizer.location(in: self.mapView)
        let coordinate = mapView.convert(touchpoint, toCoordinateFrom: self.mapView)
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = "New Location"
        annotation.subtitle = "This is a new spot"
        
        mapView.addAnnotation(annotation)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

