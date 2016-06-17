//
//  RailPath.swift
//  WMATASwift
//
//  Created by Dan Hilton on 6/17/16.
//  Copyright © 2016 Dan Hilton. All rights reserved.
//

import Foundation
import SwiftyJSON

public class RailPath {
    
    public var distanceToPrev: Int?
    public var lineCode: String?
    public var seqNum: Int?
    public var stationCode: String?
    public var stationName: String?
    
    init(json: JSON) {
        if let d = json["DistanceToPrev"].int {
            self.distanceToPrev = d
        }
        if let lc = json["LineCode"].string {
            self.lineCode = lc
        }
        if let sn = json["SeqNum"].int {
            self.seqNum = sn
        }
        if let sc = json["StationCode"].string {
            self.stationCode = sc
        }
        if let sn = json["StationName"].string {
            self.stationName = sn
        }
    }
    
}