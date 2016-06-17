//
//  StationToStation.swift
//  WMATASwift
//
//  Created by Dan Hilton on 6/17/16.
//  Copyright © 2016 Dan Hilton. All rights reserved.
//

import Foundation
import SwiftyJSON

public class StationToStation {
    
    public var sourceStation: String?
    public var destinationStation: String?
    public var compositeMiles: Float?
    public var railTime: Int?
    public var peakFare: Float?
    public var offPeakFare: Float?
    public var seniorDisabledFare: Float?
    
    
    init(json:JSON) {
        if let ss = json["SourceStation"].string {
            self.sourceStation = ss
        }
        if let ds = json["DestinationStation"].string {
            self.destinationStation = ds
        }
        if let cm = json["CompositeMiles"].float {
            self.compositeMiles = cm
        }
        if let rt = json["RailTime"].int {
            self.railTime = rt
        }
        if let pf = json["RailFare"]["PeakTime"].float {
            self.peakFare = pf
        }
        if let opf = json["RailFare"]["OffPeakTime"].float {
            self.offPeakFare = opf
        }
        if let sdf = json["RailFare"]["SeniorDisabled"].float {
            self.seniorDisabledFare = sdf
        }
    }
}