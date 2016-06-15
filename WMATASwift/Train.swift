//
//  Train.swift
//  WMATASwift
//
//  Created by Dan Hilton on 6/15/16.
//  Copyright © 2016 Dan Hilton. All rights reserved.
//

import Foundation
import SwiftyJSON

public class Train {
    
    public var car: String?
    public var destination: String?
    public var destinationCode: String?
    public var destinationName: String?
    public var group: String?
    public var line: String?
    public var locationCode: String?
    public var locationName: String?
    public var min: Int?
    
    
    init(json:JSON) {
        if let c = json["Car"].string {
            self.car = c
        }
        if let d = json["Destination"].string {
            self.destination = d
        }
        if let d = json["DestinationCode"].string {
            self.destinationCode = d
        }
        if let d = json["DestinationName"].string {
            self.destinationName = d
        }
        if let g = json["Group"].string {
            self.group = g
        }
        if let l = json["Line"].string {
            self.line = l
        }
        if let lc = json["LocationCode"].string {
            self.locationCode = lc
        }
        if let ln = json["LocationName"].string {
            self.locationName = ln
        }
        if let m = json["Min"].string {
            self.min = Int(m)
        }
    }
    
}