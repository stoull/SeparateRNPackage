//
//  RNLogger.swift
//  MyGro
//
//  Created by hut on 2023/12/25.
//

import UIKit
import React

// 日志管理
@objc(RNLogger)
class RNLogger: NSObject {
    
    /// 增加一条设备操作记录
    @objc(addDeviceOperateRecord:setType:setValue:)
    func addDeviceOperateRecord(sn: String, setType: String, setValue: String) {
        if let dList = MGHomeViewMode.readCachedDeviceList(),
           let device = dList.first(where: {$0.devId == sn}) {
            /// 如设备存在则更新添加
            MGPPowerOperateLogManager.share.addPPowerOperateRecord(userId: device.userId, deviceSn: sn, datalogSn: device.deviceSn, setType: setType, setValue: setValue)
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
