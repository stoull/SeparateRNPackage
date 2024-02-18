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
    static func createDeviceRootVC(nickName: String, deviceSN: String) -> RNRootVC? {
        // 泳康电脑
//        guard let jsBundleLocation = URL(string: "http://20.60.3.72:8081/index.bundle?platform=ios&dev=true&hot=false") else { return nil }
        // 工作电脑 macmini
        guard let jsBundleLocation = URL(string: "http://20.4.2.128:8081/index.bundle?platform=ios&dev=true&hot=false") else { return nil }
        // 工作电脑 intel wifi
//        guard let jsBundleLocation = URL(string: "http://192.168.1.157:8081/index.bundle?platform=ios&dev=true&hot=false") else { return nil}
//        guard let jsBundleLocation = Bundle.main.url(forResource: "main", withExtension: "jsbundle") else { return nil }
//        let jsBundleLocation = URL(string: "http://192.168.0.101:8081/index.bundle?platform=ios")
        
        //jsCodeLocation = [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index.ios" fallbackResource:nil];
//        +jsCodeLocation = [[NSBundle mainBundle] URLForResource:@"main" withExtension:@"jsbundle"];
        
//        guard let jsBundleLocation = Bundle.main.url(forResource: "main_manual", withExtension: "jsbundle") else { return nil }

        let mockData:NSDictionary = ["nickName": nickName,
                                     "deviceSN": deviceSN]
        
          let rootView = RCTRootView(
              bundleURL: jsBundleLocation,
              moduleName: "SeparateRNPackage",
              initialProperties: mockData as [NSObject : AnyObject],
              launchOptions: nil
          )
          let vc = RNRootVC()
          vc.view = rootView
        return vc
    }
}
