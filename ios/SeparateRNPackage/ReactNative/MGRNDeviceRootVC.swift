//
//  MGRNDeviceRootVC.swift
//  MyGro
//
//  Created by Stoull Hut on 2023/12/13.
//

import UIKit
import React


class MGRNDeviceRootVC: UIViewController {

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

extension MGRNDeviceRootVC {
    static func createDeviceRootVC(nickName: String, deviceSN: String, isBleConn: Bool, isOnline: Bool) -> MGRNDeviceRootVC? {
        // 泳康电脑
//        guard let jsBundleLocation = URL(string: "http://20.60.3.72:8081/index.bundle?platform=ios&dev=true&hot=false") else { return nil }
        // 工作电脑 macmini
//        guard let jsBundleLocation = URL(string: "http://20.4.2.128:8081/index.bundle?platform=ios&dev=true&hot=false") else { return nil }
        // 工作电脑 intel wifi
        guard let jsBundleLocation = URL(string: "http://192.168.1.157:8081/index.bundle?platform=ios&dev=true&hot=false") else { return nil}
//        guard let jsBundleLocation = Bundle.main.url(forResource: "main", withExtension: "jsbundle") else { return nil }
//        let jsBundleLocation = URL(string: "http://192.168.0.101:8081/index.bundle?platform=ios")
        
        //jsCodeLocation = [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index.ios" fallbackResource:nil];
//        +jsCodeLocation = [[NSBundle mainBundle] URLForResource:@"main" withExtension:@"jsbundle"];
        
//        guard let jsBundleLocation = Bundle.main.url(forResource: "main_manual", withExtension: "jsbundle") else { return nil }
        
        let username = MGAuthenticator.share.currentUser.uid
        let authToken = MGAuthenticator.share.currentCpowerAuthToken?.tokenString ?? ""
        let mockData:NSDictionary = ["nickName": nickName,
                                     "deviceSN": deviceSN,
                                     "isBleConn": isBleConn,
                                     "online": isOnline ? 1 : 0,
                                     "authorization": authToken]
        
          let rootView = RCTRootView(
              bundleURL: jsBundleLocation,
              moduleName: "myGroPlugin",
              initialProperties: mockData as [NSObject : AnyObject],
              launchOptions: nil
          )
          let vc = MGRNDeviceRootVC()
          vc.view = rootView
        return vc
    }
}
