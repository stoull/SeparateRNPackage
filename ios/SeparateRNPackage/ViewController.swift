//
//  ViewController.swift
//  SeparateRNPackage
//
//  Created by Stoull Hut on 2024/2/18.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var baseResultTextView: UITextView!
    @IBOutlet weak var inverterResultTextView: UITextView!
    
    var baseModule: RNBridge?
    var invertKitModule: RNBridge?
    
    var rnBaseModule = RNBase.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "原生App Root"
        
        // 加载base模块
        self.prepareReactNativeBase()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.baseResultTextView.text = "Base模块调用结果：settingup Bridge"
        
        self.inquiryDeviceInfo()
    }
    
    func prepareReactNativeBase() {
        baseModule = RNBridge()
        // 提前加载base模块
        DispatchQueue.global().async {
            self.baseModule?.setupBridge(type: .base)
    //        baseModule = RNRootVC.createRootVC(type: PackageType.base, nickName: "RN-RootVC", deviceSN: "Test-SN")
        }
    }
    
    func prepareInvertKitModule() {
        invertKitModule = RNBridge()
        // 提前加载base模块
        DispatchQueue.global().async {
            self.invertKitModule?.setupBridge(type: .inverterkit)
    //        baseModule = RNRootVC.createRootVC(type: PackageType.base, nickName: "RN-RootVC", deviceSN: "Test-SN")
        }
    }
    
    var isLoadAddtionalModule: Bool = false
    func loadAddtionModule() {
        if isLoadAddtionalModule == false {
            // 在Base模块上加载新的模块
//            self.baseModule?.bridge?.registerSegment(withId: 33, path: PackageType.inverterkit.packageUrl?.relativePath)
            self.prepareInvertKitModule()
            
            isLoadAddtionalModule = true
        }
    }
    
    // 调用base模块的js代码获取设备信息
    func inquiryDeviceInfo() {
        // 提前调用base模块的js代码
        // RNBase会进行懒加载，这里提前加载
        let _ = baseModule?.bridge?.module(forName: "RNBase")
        DispatchQueue.global().asyncAfter(deadline: DispatchTime.now()+2.0) {
            // 发消息
            RNBase.shared?.inquiryDeviceInfo(result: { jsonString in
                print("获取到设备信息：\(jsonString)")
                DispatchQueue.main.async {
                    self.baseResultTextView.text = "Base模块调用结果：" + jsonString
                }
            })
        }
        
        // 因在JS端,通过registerCallableModule或registerLazyCallableModule接口注册被ReactNative废弃，此方式不可用，
        // 通过NativeModules中的NativeEventEmitter进行Native-JS的操作
        // await bridgeManager.bridge?.enqueueJSCall("Base", method: "TestMethod", args: ["arg1", "arge2"])
    }
    
    // 调用Addtional包的方法
    func addtionalFunction() {
        // 调用Addtional包的方法
        RNBase.shared?.inquiryAddtionalFunctionInfo(result: { jsonString in
            print("调用Addtional包的方法：\(jsonString)")
            DispatchQueue.main.async {
                self.inverterResultTextView.text = "InverterKit 模块调用结果：" + jsonString
            }
        })
    }


    @IBAction func pushRNVC(_ sender: UIButton) {
        // 根据不同的模块，加载不同的业务jsbundle
        
        let packageType = PackageType.init(rawValue: sender.tag) ?? .index
        
        if packageType == .base {
            self.inquiryDeviceInfo()
        } else if packageType == .inverterkit {
            self.loadAddtionModule()
            self.addtionalFunction()
        } else {
            if let rnVC = RNRootVC.createRootVC(type: packageType, nickName: "RN-RootVC", deviceSN: "Test-SN") {
                self.navigationController?.pushViewController(rnVC, animated: true)
            }
        }
    }
}
