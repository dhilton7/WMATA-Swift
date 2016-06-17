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
    
    public func getNextTrain(stationCodes: String?, success: ([Train])->Void, failure:(NSError)->Void) {
        self.jsonGetRequestWithPath("StationPrediction.svc/json/GetPrediction/\(stationCodes ?? "All")", success: { (json:JSON) in
            if let trainJson = json["Trains"].array {
                var trains = [Train]()
                for json in trainJson {
                    trains.append(Train(json: json))
                }
                success(trains)
            }
            }, failure: failure)
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
        let path = lineCode == nil ? "Rail.svc/json/jStations" : "Rail.svc/json/jStations?LineCode=\(lineCode!)"
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
    
    public func getStationInformation(stationCode: String?, success: (Station)->Void, failure:(NSError)->Void) {
        self.jsonGetRequestWithPath("Rail.svc/json/jStationInfo?StationCode=\(stationCode ?? "")", success: { (json:JSON) in
            success(Station(json: json))
            }, failure: failure)
    }
    
    public func getPathBetweenStations(fromStationCode: String, toStationCode: String, success: ([RailPath])->Void, failure: (NSError)->Void) {
        self.jsonGetRequestWithPath("Rail.svc/json/jPath?FromStationCode=\(fromStationCode)&ToStationCode=\(toStationCode)", success: { (json:JSON) in
            if let pathJson = json["Path"].array {
                var path = [RailPath]()
                for json in pathJson {
                    path.append(RailPath(json: json))
                }
                success(path)
            }
            }, failure: failure)
    }
    
    
}