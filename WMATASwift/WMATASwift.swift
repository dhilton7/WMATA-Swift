//
//  WMATASwift.swift
//  WMATASwift
//
//  Created by Dan Hilton on 6/15/16.
//  Copyright © 2016 Dan Hilton. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

public class WMATASwift {
    
    internal(set) var apiKey: String
    internal(set) var baseUrl: String
    var manager = Alamofire.Manager.sharedInstance
    
    public init(apiKey: String) {
        self.apiKey = apiKey
        self.baseUrl = "https://api.wmata.com/"
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        configuration.timeoutIntervalForResource = 6
        configuration.timeoutIntervalForRequest = 6
        manager = Alamofire.Manager(configuration: configuration)
    }
    
    // JSON Requests
    
    internal func jsonGetRequestWithPath(path: String, success: (JSON)->Void, failure: (NSError)->Void) {
        
        manager.request(.GET, "\(self.baseUrl)\(path)", parameters: nil, encoding: .JSON, headers: ["api_key": self.apiKey])
            .validate()
            .responseJSON { response in
                if let err = response.result.error {
                    failure(NSError(domain: err.domain, code: err.code, userInfo: err.userInfo))
                }
                else if let val = response.result.value {
                    success(JSON(val))
                }
            }
        
    }
    
}