//
//  RNModuleManager.swift
//  SeparateRNPackage
//
//  Created by Hut Chen on 2024/2/19.
//

import Foundation

@objc(RNModuleManager)
class RNBridgeManager: NSObject {
    static let shared = RNBridgeManager()
    
    var bridge: RCTBridge?
    
    override init() {
        super.init()
        self.initBridge()
    }

    func initBridge() {
        if let sourceUrl = PackageType.base.packageUrl {
            self.bridge = RCTBridge(delegate: self, bundleURL: sourceUrl, moduleProvider: nil)
        }
    }
}

extension RNBridgeManager: RCTBridgeDelegate {
    func sourceURL(for bridge: RCTBridge!) -> URL! {
        if let sourceUrl = PackageType.base.packageUrl {
            return sourceUrl
        } else {
            return nil
        }
    }
}
