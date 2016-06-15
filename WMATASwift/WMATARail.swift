//
//  WMATARail.swift
//  WMATASwift
//
//  Created by Dan Hilton on 6/15/16.
//  Copyright © 2016 Dan Hilton. All rights reserved.
//

import Foundation
import SwiftyJSON

public extension WMATASwift {
    
    public func getNextTrain(stationCode: String?, success: (JSON)->Void, failure:(NSError)->Void) {
        self.jsonGetRequestWithPath("StationPrediction.svc/json/GetPrediction/\(stationCode ?? "All")", success: success, failure: failure)
    }
    
    public func getTrainLines(success: ([Line])->Void, failure:(NSError)->Void) {
        self.jsonGetRequestWithPath("Rail.svc/json/jLines", success: { (json:JSON) in
            if let linesJson = json["Lines"].array {
                var lines = [Line]()
                for json in linesJson {
                    lines.append(Line(json: json))
                }
                success(lines)
            }
            }, failure: failure)
    }
    
    public func getStopsForLine(lineCode: String?, success: ([Station])->Void, failure:(NSError)->Void) {
        let path = lineCode == nil ? "Rail.svc/json/jStations" : "Rail.svc/json/jStations?\(lineCode!)"
        self.jsonGetRequestWithPath(path, success: { (json:JSON) in
            if let stopsJson = json["Stations"].array {
                var stations = [Station]()
                for json in stopsJson {
                    stations.append(Station(json: json))
                }
                success(stations)
            }
            }, failure: failure)
    }
    
    
}