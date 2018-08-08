//
//  CarAnnotation.swift
//  AutoTracker
//
//  Created by Kamil Kwiatkowski on 23/09/2017.
//  Copyright © 2017 Dignital. All rights reserved.
//

import UIKit
import MapKit

struct CarConstants {
    static let kReuseIdentifier = "carPin"
    static let kCarImageName = "car"
}

class CarAnnotation: MKAnnotationView {
    
    init(annotation: MKAnnotation) {
        super.init(annotation: annotation, reuseIdentifier: CarConstants.kReuseIdentifier)
        self.canShowCallout = true
        let carImage: UIImage = UIImage.init(named: CarConstants.kCarImageName)!
        self.image = carImage
        self.contentMode = .scaleToFill
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

