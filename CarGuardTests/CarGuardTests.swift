//
//  CarGuardTests.swift
//  CarGuardTests
//
//  Created by Kamil Kwiatkowski on 25/05/2018.
//  Copyright © 2018 Dignital. All rights reserved.
//

import XCTest
import MapKit
@testable import CarGuard

class CarGuardTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testPositionFromJson() {
        let jsonData = fakeJSONData()
        let coord:CLLocationCoordinate2D =  PositionMonitor().positionFromJson(jsonData)!
        assert(coord.latitude == 51.738656666666664)
        assert(coord.longitude == 19.56618)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func fakeJSONData() -> (Data) {
        if let url = Bundle.main.url(forResource:"PositionsJSON", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                return data
            } catch {
                print("error:\(error)")
            }
        }
        return Data()
    }
}
