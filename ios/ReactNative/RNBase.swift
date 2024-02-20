//
//  RNBase.swift
//  SeparateRNPackage
//
//  Created by Hut Chen on 2024/2/19.
//

import Foundation
import React

enum EVENTS: String, CaseIterable {
    // 查询设备信息
    case inquiryDeviceInfo = "INQUIRY-DEVICE-INFO"
    // 查询设备升级信息
    case checkUpdate = "INQUIRY-DEVICE-UPDATE"
    // 使用多包时，调用Addtional包的方法
    case addtionalFunction = "Addtional-Function"
}

@objc(RNBase)
class RNBase: RCTEventEmitter {
    public static var shared: RNBase?
    
    var hasListeners: Bool = false
    
    @objc
    override init() {
        super.init()
        RNBase.shared = self
    }
    
    // 查询设备信息
    typealias CallbackHandler = ((String)->Void)
    private var callbackHandle: CallbackHandler?
    func inquiryDeviceInfo(result: @escaping CallbackHandler) {
        if hasListeners {
            self.sendEvent(withName: EVENTS.inquiryDeviceInfo.rawValue, body: "{}")
        }
        callbackHandle = result
    }
    
    func inquiryDeviceUpdateInfo(result: @escaping CallbackHandler) {
        if hasListeners {
            self.sendEvent(withName: EVENTS.checkUpdate.rawValue, body: "{}")
        }
        callbackHandle = result
    }
    
    func inquiryAddtionalFunctionInfo(result: @escaping CallbackHandler) {
        if hasListeners {
            self.sendEvent(withName: EVENTS.addtionalFunction.rawValue, body: "{}")
        }
        callbackHandle = result
    }
    
    // 查询设备信息
    @objc(inquiryDeviceInfoCallBack:)
    func inquiryDeviceInfoCallBack(infoJSON: String) {
        self.callbackHandle?(infoJSON)
    }
    
    // 查询设备升级信息
    @objc(checkUpdateCallBack:)
    func checkUpdateCallBack(infoJSON: String) {
        self.callbackHandle?(infoJSON)
    }
    
    // 使用多包时，调用Addtional包的方法
    @objc(addtionalFunction:)
    func addtionalFunction(infoJSON: String) {
        self.callbackHandle?(infoJSON)
    }
    
    @objc
    override func supportedEvents() -> [String]! {
        // 可订阅的事件名称
        return Array(EVENTS.allCases.map{$0.rawValue})
    }
    
    override static func requiresMainQueueSetup() -> Bool {
      return false
    }
    
    // Will be called when this module's first listener is added.
    @objc
    override func startObserving() {
        hasListeners = true
    }
    
    // Will be called when this module's last listener is removed, or on dealloc.
    @objc
    override func stopObserving() {
        hasListeners = false
    }
}
