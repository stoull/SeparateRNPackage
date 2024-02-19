//
//  RNRootVC.swift
//  SeparateRNPackage
//
//  Created by hut on 2024/2/18.
//

import UIKit
import React


class RNRootVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Native - Home"
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        self.tabBarController?.tabBar.isHidden = true
    }
}

extension RNRootVC {
    static func createRootVC(type: PackageType, nickName: String, deviceSN: String) -> RNRootVC? {
        guard let jsBundleLocation = type.packageUrl else { return nil }
        
        let mockData:NSDictionary = ["nickName": nickName,
                                     "deviceSN": deviceSN]
        
        let rootView = RCTRootView(
              bundleURL: jsBundleLocation,
              moduleName: type.info.moduelName,
              initialProperties: mockData as [NSObject : AnyObject],
              launchOptions: nil
        )
        let vc = RNRootVC()
        vc.view = rootView
        return vc
    }
    
    static func createRootVC(bridge: RCTBridge, type: PackageType, nickName: String, deviceSN: String) -> RNRootVC? {
        let mockData:NSDictionary = ["nickName": nickName,
                                     "deviceSN": deviceSN]
        let rootView = RCTRootView(
            frame: UIScreen.main.bounds,
            bridge: bridge,
            moduleName: type.info.moduelName,
            initialProperties: mockData as [NSObject : AnyObject]
        )
        
        let vc = RNRootVC()
        vc.view = rootView
        return vc
    }
    
}
