//
//  Station.swift
//  WMATASwift
//
//  Created by Dan Hilton on 6/15/16.
//  Copyright © 2016 Dan Hilton. All rights reserved.
//

import Foundation
import SwiftyJSON

public class Station {
    
    public var code: String?
    public var lineCodes: [String]?
    public var name: String?
    public var longitude: Float?
    public var latitude: Float?
    
    init(json:JSON) {
        if let c = json["Code"].string {
            self.code = c
        }
        if let lc1 = json["LineCode1"].string {
            lineCodes = [String]()
            lineCodes?.append(lc1)
        }
        if let lc2 = json["LineCode2"].string {
            lineCodes?.append(lc2)
        }
        if let lc3 = json["LineCode3"].string {
            lineCodes?.append(lc3)
        }
        if let lc4 = json["LineCode4"].string {
            lineCodes?.append(lc4)
        }
        if let n = json["Name"].string {
            self.name = n
        }
        if let l = json["Lon"].float {
            self.longitude = l
        }
        if let l = json["Lat"].float {
            self.latitude = l
        }
    }
    
}