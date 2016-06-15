//
//  Line.swift
//  WMATASwift
//
//  Created by Dan Hilton on 6/15/16.
//  Copyright © 2016 Dan Hilton. All rights reserved.
//

import Foundation
import SwiftyJSON

public class Line {
    
    public var displayName: String?
    public var startStationCode: String?
    public var endStationCode: String?
    public var internalDestination1: String?
    public var internalDestination2: String?
    public var lineCode: String?
    
    
    init(json: JSON) {
        if let dn = json["DisplayName"].string {
            self.displayName = dn
        }
        if let ssc = json["StartStationCode"].string {
            self.startStationCode = ssc
        }
        if let esc = json["EndStationCode"].string {
            self.endStationCode = esc
        }
        if let id1 = json["InternalDestination1"].string {
            self.internalDestination1 = id1
        }
        if let id2 = json["InternalDestination2"].string {
            self.internalDestination2 = id2
        }
        if let lc = json["LineCode"].string {
            self.lineCode = lc
        }
    }
    
}