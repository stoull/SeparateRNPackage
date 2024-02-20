//
//  RNModuleManager.swift
//  SeparateRNPackage
//
//  Created by Hut Chen on 2024/2/19.
//

import Foundation

@objc(RNModuleManager)
class RNBridge: NSObject {
    static let shared = RNBridge()
    
    var bridge: RCTBridge?
    
    convenience init(type: PackageType) {
        self.init()
        self.setupBridge(type: type)
    }
    
    override init() {
        super.init()
    }

    func setupBridge(type: PackageType) {
        if let sourceUrl = PackageType.base.packageUrl {
            self.bridge = RCTBridge(delegate: self, bundleURL: sourceUrl, moduleProvider: nil)
        }
    }
}

extension RNBridge: RCTBridgeDelegate {
    func sourceURL(for bridge: RCTBridge!) -> URL! {
        if let sourceUrl = PackageType.base.packageUrl {
            return sourceUrl
        } else {
            return nil
        }
    }
}
