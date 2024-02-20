//
//  ViewController.swift
//  SeparateRNPackage
//
//  Created by Stoull Hut on 2024/2/18.
//

import UIKit

class ViewController: UIViewController {
    
    let bridgeManager = RNBridge.shared
    
    var rnBaseModule = RNBase.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "原生App Root"
        
//        bridgeManager.setupBridge(type: .base)
//        bridgeManager.bridge?.start()
        baseModule = RNRootVC.createRootVC(type: PackageType.base, nickName: "RN-RootVC", deviceSN: "Test-SN")
    }
    
    var baseModule: RNRootVC?
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.inquiryDeviceInfo()
    }
    
    func inquiryDeviceInfo() {
    #warning("因在JS端,通过registerCallableModule或registerLazyCallableModule接口注册被ReactNative废弃，此方式不可用，通过NativeModules中的NativeEventEmitter进行Native-JS的操作")
//                await bridgeManager.bridge?.enqueueJSCall("Base", method: "TestMethod", args: ["arg1", "arge2"])
        
        // 提前加载信息
        // RNBase会进行懒加载，这里提前加载
        if let baseModule = self.baseModule {
            DispatchQueue.global().asyncAfter(deadline: DispatchTime.now()+2.0) {
                let rnbase = baseModule.rnRootView?.bridge.module(forName: "RNBase")
                // 发消息
                RNBase.shared?.inquiryDeviceInfo()
            }
        }
    }


    @IBAction func pushRNVC(_ sender: UIButton) {
        
        let packageType = PackageType.init(rawValue: sender.tag) ?? .index
        
        if packageType == .base,
           let bVC = self.baseModule {
            self.navigationController?.pushViewController(bVC, animated: true)
            self.inquiryDeviceInfo()
        } else {
            if let rnVC = RNRootVC.createRootVC(type: packageType, nickName: "RN-RootVC", deviceSN: "Test-SN") {
                self.navigationController?.pushViewController(rnVC, animated: true)
            }
        }
    }
    
}

