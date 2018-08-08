//
//  PositionMonitor.swift
//  CarGuard
//
//  Created by Kamil Kwiatkowski on 25/05/2018.
//  Copyright © 2018 Dignital. All rights reserved.
//

import Foundation
import CoreLocation

protocol PositionMonitorDelegate {
    func didRefreshPosition(coordinates : CLLocationCoordinate2D)
}

class PositionMonitor: NSObject, NetworkProtocol {
    
    var delegate : PositionMonitorDelegate?
    let networkManager = NetworkManager.sharedInstance
    var timer = Timer()
    
    func startUpdatingPostion() {
        networkManager.delegate = self
        updateLocation()
        self.timer = Timer.scheduledTimer(timeInterval: 30,
                             target: self,
                             selector: #selector(updateLocation),
                             userInfo: nil,
                             repeats: true)
    }
    
    func stopUpdatingPosition() {
        self.timer.invalidate()
    }
    
    @objc func updateLocation() {
        networkManager.fetchPositions()
    }
    
    //NetworkProtocol
    func didReceived(positions: Data?) {
        print("received positions")
        if let positionsJson = positions {
            if let position = positionFromJson(positionsJson) {
                delegate?.didRefreshPosition(coordinates: position)
            }
        }
    }
    
    func didReceived(devices: Data?) {
        print("received devices")
    }
    
    func didFailedRequest() {
        print("request failed")
    }
    
    func positionFromJson(_ json : Data) -> CLLocationCoordinate2D? {
        let decoder = JSONDecoder()
        var coordinates = CLLocationCoordinate2D()
        do {
            //let jsonString = String(data: json, encoding: .utf8)
            let position = try decoder.decode([Position].self, from:json)
            if let pos = position.first {
                coordinates = CLLocationCoordinate2D.init(latitude: pos.latitude, longitude: pos.longitude)
            }
        } catch  {
            print("Error: \(error)")
        }
        return coordinates
    }
}
