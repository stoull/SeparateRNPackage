//
//  RNDeviceDataUpdater.swift
//  MyGro
//
//  Created by hut on 2023/12/25.
//

import Foundation
import React

enum EVENTS: String, CaseIterable {
    case subscribe = "SUBSCRIBE_MQTT"
}

@objc(RNDeviceDataUpdater)
class RNDeviceDataUpdater: RCTEventEmitter {
    var connection: MGPPowerConnection?
    
    /**
     type:
     0: Infinity 1500
     1: Vita 550
     2: Infinity 1300
     3: Infinity 2000
     4: Infinity 1300 pro
     */
    @objc(startUpdate:type:)
    func startUpdate(sn: String, type: Int) -> Void {
        let device = MGDevice.init(jsonObj: JSON(["deviceSn": sn, "devType":type]))
        let connection = MGPPowerConnection(device: device, delegate: self)
        connection.setUpMqttConnect()
        connection.delegate = self
        self.connection = connection
        sw_dispatchOnMainQueueAfter(6.0) {
            connection.startTimingUpdate()
        }
    }
    
    @objc(stopUpdate)
    func stopUpdate() -> Void {
        self.connection?.stopUpdatorTiming()
    }
    
    override func supportedEvents() -> [String]! {
        // 可订阅的事件名称
        return Array(EVENTS.allCases.map{$0.rawValue})
    }
    
    override static func requiresMainQueueSetup() -> Bool {
      return false
    }
    
    func constantsToExport() -> NSDictionary {
        return [:]
    }
}

// MARK: - 有数据更新
extension RNDeviceDataUpdater: MGPPowerConnectionDelegate {
    func dataDidUpdate(model: MGPPowerDataModel, type: MGPPowerConnectionDataType) {
        if type == .blth_Input {

        } else if type == .blth_Holding {

        } else if type == .api_Input {
            
        } else if type == .api_Holding {
        }
        if let newData = model.jsonObject.rawString() {
            self.sendEvent(withName: EVENTS.subscribe.rawValue, body: newData)
        }
    }
    
    func dataFailedUpdate(model: MGPPowerDataModel, type: MGPPowerConnectionDataType, errorMsg: String) {
        if type == .blth_Input {
        } else if type == .blth_Holding {
        } else if type == .api_Input {
        } else if type == .api_Holding {
            self.sendEvent(withName: EVENTS.subscribe.rawValue, body: NSLocalizedString("失败", comment: ""))
        }
    }
}
