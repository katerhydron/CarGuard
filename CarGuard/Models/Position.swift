//
//  Position.swift
//  CarGuard
//
//  Created by Kamil Kwiatkowski on 25/05/2018.
//  Copyright © 2018 Dignital. All rights reserved.
//

import Foundation

struct Position : Codable {
        let deviceId: Int
        let latitude: Double
        let longitude: Double
        let attributes: Attributes
}

struct Attributes : Codable {
    let charge: Bool?
    let ignition: Bool?
    let ip: String
    let status: String
}

//"attributes": {
//    "charge": 1,
//    "ignition": 0,
//    "ip": "188.146.32.122",
//    "status": 0
