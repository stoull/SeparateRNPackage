//
//  RNDevice.swift
//  MyGro
//
//  Created by hut on 2023/12/25.
//

import UIKit
import React

@objc(RNDevice)
class RNDevice: NSObject {
    var networkHelper = GTNetworkHelper.share
    
    // 硬件网络环境相关

    /// 当前是否是有网络连接
    @objc(isCurrentedToNetwork:)
    func isCurrentedToNetwork(callback: RCTResponseSenderBlock) {
        callback([networkHelper.isCurrentedToNetwork, NSNull.init()])
    }
    
    /// 当前是否是使用WiFi网络
    @objc(isCurrentConnectToWiFi:)
    func isCurrentConnectToWiFi(callback: RCTResponseSenderBlock) {
        callback([networkHelper.isCurrentConnectToWiFi, NSNull.init()])
    }
    
    /**
     **获取当前系统连接的WiFi名称**
     * 因当前系统没有连接WiFi,或权限不足，都为失败回调
     */
    @objc(currentWiFiName:)
    func currentWiFiName(callback: @escaping RCTResponseSenderBlock) {
        networkHelper.getCurrentWiFiName { wifiName in
            callback([wifiName, NSNull.init()])
        } failed: {
            callback([NSNull.init(), NSLocalizedString("失败", comment: "")])
        }
    }
    
    @objc
    static func requiresMainQueueSetup() -> Bool {
      return false
    }
    
    @objc
    func constantsToExport() -> NSDictionary {
        return [:]
    }
}
