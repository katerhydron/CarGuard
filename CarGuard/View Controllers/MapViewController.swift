//
//  ViewController.swift
//  CarGuard
//
//  Created by Kamil Kwiatkowski on 25/05/2018.
//  Copyright © 2018 Dignital. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: BaseViewController, PositionMonitorDelegate, MKMapViewDelegate {

    let positionMonitor = PositionMonitor()
    var carAnnotation = MKPointAnnotation()
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.positionMonitor.delegate = self
        self.mapView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //positionMonitor.startUpdatingPostion()
        self.mapView.addAnnotation(self.carAnnotation);
    }
    
    func didRefreshPosition(coordinates: CLLocationCoordinate2D) {
        print("current coordinates: lat:\(coordinates.latitude) lon:\(coordinates.longitude)")
        DispatchQueue.main.async {
            self.carAnnotation.coordinate = coordinates
            self.zoomToLocation(location: coordinates)
        }
    }

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: CarConstants.kReuseIdentifier)
        
        if annotationView == nil {
            annotationView = CarAnnotation(annotation: annotation)
        } else {
            annotationView?.annotation = annotation
        }
        return annotationView
    }
    
    func zoomToLocation(location: CLLocationCoordinate2D) {
        let span = MKCoordinateSpanMake(0.02, 0.02)
        let region = MKCoordinateRegionMake(location, span)
        self.mapView.setRegion(region, animated: true)
    }
}
