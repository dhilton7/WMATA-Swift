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
    public var compositeMiles: Double?
    public var railTime: Int?
    public var peakFare: Double?
    public var offPeakFare: Double?
    public var seniorDisabledFare: Double?
    
    
    init(json:JSON) {
        if let ss = json["SourceStation"].string {
            self.sourceStation = ss
        }
        if let ds = json["DestinationStation"].string {
            self.destinationStation = ds
        }
        if let cm = json["CompositeMiles"].double {
            self.compositeMiles = cm
        }
        if let rt = json["RailTime"].int {
            self.railTime = rt
        }
        if let pf = json["RailFare"]["PeakTime"].double {
            self.peakFare = pf
        }
        if let opf = json["RailFare"]["OffPeakTime"].double {
            self.offPeakFare = opf
        }
        if let sdf = json["RailFare"]["SeniorDisabled"].double {
            self.seniorDisabledFare = sdf
        }
    }
}