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

enum PackageType: Int {
    case index = 0
    case base
    case infinity2000
    case inverterkit
    
    var info: (name: String, moduelName: String, packageName: String) {
        var n: String = ""
        var m: String = ""
        var p: String = ""
        switch self {
        case .index:
            n = "SeparateRNPackage"
            m = "SeparateRNPackage"
            p = "index"
        case .base:
            n = "Base"
            m = "Base"
            p = "base"
        case .infinity2000:
            n = "Infinity2000"
            m = "Infinity2000"
            p = "infinity2000"
        case .inverterkit:
            n = "InverterKit"
            m = "InverterKit"
            p = "inverterkit"
        }
        return (n, m, p)
    }
}

extension RNRootVC {
    static func createDeviceRootVC(type: PackageType, nickName: String, deviceSN: String) -> RNRootVC? {
        // 泳康电脑
//        guard let jsBundleLocation = URL(string: "http://20.60.3.72:8081/index.bundle?platform=ios&dev=true&hot=false") else { return nil }
        // 工作电脑 macmini
//        guard let jsBundleLocation = URL(string: "http://20.4.2.128:8081/index.bundle?platform=ios&dev=true&hot=false") else { return nil }
        // 工作电脑 intel wifi
//        guard let jsBundleLocation = URL(string: "http://192.168.1.157:8081/index.bundle?platform=ios&dev=true&hot=false") else { return nil}
//        guard let jsBundleLocation = Bundle.main.url(forResource: "main", withExtension: "jsbundle") else { return nil }
//        let jsBundleLocation = URL(string: "http://192.168.0.101:8081/index.bundle?platform=ios")
        
        //jsCodeLocation = [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index.ios" fallbackResource:nil];
//        +jsCodeLocation = [[NSBundle mainBundle] URLForResource:@"main" withExtension:@"jsbundle"];
        
        guard let jsBundleLocation = Bundle.main.url(forResource: type.info.packageName, withExtension: "jsbundle") else { return nil }

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
}
