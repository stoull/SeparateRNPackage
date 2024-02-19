//
//  ViewController.swift
//  SeparateRNPackage
//
//  Created by Stoull Hut on 2024/2/18.
//

import UIKit

class ViewController: UIViewController {
    
    let bridgeManager = RNBridgeManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "原生App Root"
        
    }
    
    var baseModule: RNRootVC?
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        baseModule = RNRootVC.createRootVC(type: PackageType.base, nickName: "RN-RootVC", deviceSN: "Test-SN")
        
    }

    @IBAction func pushRNVC(_ sender: UIButton) {
        Task { @MainActor in
            
            let packageType = PackageType.init(rawValue: sender.tag) ?? .index
            
            if packageType == .base,
               let bVC = self.baseModule {
                self.navigationController?.pushViewController(bVC, animated: true)
                
                print("xxxxxx await enqueueJSCall")
                await bridgeManager.bridge?.enqueueJSCall("Base", method: "TestMethod", args: ["arg1", "arge2"])
                print("xxxxxx fininshed enqueueJSCall")
                
            } else {
                if let rnVC = RNRootVC.createRootVC(type: packageType, nickName: "RN-RootVC", deviceSN: "Test-SN") {
                    self.navigationController?.pushViewController(rnVC, animated: true)
                }
            }
        }
    }
    
}

