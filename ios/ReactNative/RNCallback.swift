//
//  RNCallback.swift
//  SeparateRNPackage
//
//  Created by Hut Chen on 2024/2/20.
//

import Foundation
import React

@objc(RNCallback)
class RNCallback: NSObject {
    
    
    
    
    
    @objc
    static func requiresMainQueueSetup() -> Bool {
      return false
    }
    
    @objc
    func constantsToExport() -> NSDictionary {
        return [:]
    }
}
