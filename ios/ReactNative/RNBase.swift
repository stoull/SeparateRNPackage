//
//  RNBase.swift
//  SeparateRNPackage
//
//  Created by Hut Chen on 2024/2/19.
//

import Foundation
import React

enum EVENTS: String, CaseIterable {
    case inquiryDeviceInfo = "INQUIRY-DEVICE-INFO"
}

@objc(RNBase)
class RNBase: RCTEventEmitter {
    public static var shared: RNBase?
    
    var hasListeners: Bool = true
    
    @objc
    override init() {
        super.init()
        RNBase.shared = self
    }
    
    @objc
    override func supportedEvents() -> [String]! {
        // 可订阅的事件名称
        return Array(EVENTS.allCases.map{$0.rawValue})
    }
    
    override static func requiresMainQueueSetup() -> Bool {
      return false
    }
    
    
//    - (void)startObserving;
//    - (void)stopObserving;
    
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
    
    
    /// 查询设备信息
    @objc(inquiryDeviceInfoCallBack:)
    func inquiryDeviceInfoCallBack(infoJSON: String) {
        print("xxxxxx inquiryDeviceInfoCallBack: \(infoJSON)")
    }
}

// MARK: - 有数据更新
extension RNBase {
    /// 查询设备信息
    func inquiryDeviceInfo() {
        if hasListeners {
            self.sendEvent(withName: EVENTS.inquiryDeviceInfo.rawValue, body: "{}")
            print("xxx inquiryDeviceInfo")
        }
    }
}
