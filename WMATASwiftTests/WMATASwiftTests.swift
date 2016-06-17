//
//  WMATASwiftTests.swift
//  WMATASwiftTests
//
//  Created by Dan Hilton on 6/15/16.
//  Copyright © 2016 Dan Hilton. All rights reserved.
//

import XCTest
import SwiftyJSON
@testable import WMATASwift

class WMATASwiftTests: XCTestCase {
    
    internal var wrapper = WMATASwift(apiKey: "6b700f7ea9db408e9745c207da7ca827")
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        
    }
    
    func testGetStopsForLine() {
        let expectation = expectationWithDescription("Get stations List")
        
        wrapper.getStopsForLine("GR", success: { (stations:[Station]) in
            expectation.fulfill()
        }) { (error:NSError) in
            XCTFail(error.localizedDescription)
        }
        
        waitForExpectationsWithTimeout(10) { error in
            if (error != nil) {
                XCTFail(error!.description)
            }
        }
    }
    
    func testGetNextTrain() {
        let expectation = expectationWithDescription("Get next train")
        
        wrapper.getNextTrain("B10", success: { (trains:[Train]) in
            expectation.fulfill()
            }, failure: { error in
                XCTFail(error.localizedDescription)
        })
        
        waitForExpectationsWithTimeout(10) { error in
            if (error != nil) {
                XCTFail(error!.description)
            }
        }
    }
    
    func testStationInfo() {
        let expectation = expectationWithDescription("Get station information")

        wrapper.getStationInformation("A01", success: { (station:Station) in
            print(station.streetAddress, station.city, station.state, station.zip, station.latitude, station.longitude, station.lineCodes, station.name)
            expectation.fulfill()
        }) { (error:NSError) in
                XCTFail(error.localizedDescription)
        }
        
        waitForExpectationsWithTimeout(10) { error in
            if (error != nil) {
                XCTFail(error!.description)
            }
        }
    }
    
    func testPathBetweenStations() {
        let expectation = expectationWithDescription("Get path between stations")
        
        wrapper.getPathBetweenStations("N06", toStationCode: "G05", success: { (path:[RailPath]) in
            let p = path[1]
            print(p.distanceToPrev, p.lineCode, p.seqNum, p.stationCode, p.stationName)
            expectation.fulfill()
        }) { (error:NSError) in
            XCTFail(error.localizedDescription)
        }
        
        waitForExpectationsWithTimeout(10) { error in
            if error != nil {
                XCTFail(error!.localizedDescription)
            }
        }
    }
    
    func testStationToStationInfo() {
        let expectation = expectationWithDescription("Get station to station information")
        
        wrapper.getStationToStationInfo("E10", toStationCode: "J03", success: { (info:[StationToStation]) in
            let s = info[0]
            print(s.compositeMiles, s.destinationStation, s.offPeakFare, s.peakFare, s.railTime, s.seniorDisabledFare, s.sourceStation)
            expectation.fulfill()
        }) { (error:NSError) in
                XCTFail(error.localizedDescription)
        }
        
        waitForExpectationsWithTimeout(10) { (error) in
            if error != nil {
                XCTFail(error!.localizedDescription)
            }
        }
    }
    
}
