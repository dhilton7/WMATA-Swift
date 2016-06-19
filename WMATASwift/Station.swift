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
    
    public var streetAddress: String?
    public var state: String?
    public var city: String?
    public var zip: String?
    public var code: String?
    public var lineCodes: [String]?
    public var name: String?
    public var longitude: Double?
    public var latitude: Double?
    
    init(json:JSON) {
        if let s = json["Address"]["Street"].string {
            self.streetAddress = s
        }
        if let s = json["Address"]["State"].string {
            self.state = s
        }
        if let c = json["Address"]["City"].string {
            self.city = c
        }
        if let z = json["Address"]["Zip"].string {
            self.zip = z
        }
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
        if let l = json["Lon"].double {
            self.longitude = l
        }
        if let l = json["Lat"].double {
            self.latitude = l
        }
    }
    
}