//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Tyler Helwig on 6/5/18.
//  Copyright © 2018 Tyler Helwig. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    var mapView: MKMapView!
    
    override func loadView() {
        //create map view
        mapView = MKMapView()
        
        //set it as *the* view
        view = mapView
        
        let segmentedControl = UISegmentedControl(items: ["Standard","Satellite","Hybrid"])
        segmentedControl.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(segmentedControl)
        
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        let margins = view.layoutMarginsGuide
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("MapViewController loaded its view")
    }
    
}
