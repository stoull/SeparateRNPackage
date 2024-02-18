//
//  RNBluetooth.swift
//  MyGro
//
//  Created by hut on 2023/12/25.
//

import UIKit
import React

@objc(RNBluetooth)
class RNBluetooth: NSObject {
    @objc
    static func requiresMainQueueSetup() -> Bool {
      return false
    }
    
    @objc
    func constantsToExport() -> NSDictionary {
        return [:]
    }
    
    /// 发送数据
    @objc(sendByteData:bytes:)
    func sendByteData(sendId: String, bytes: NSArray) {
        if let bytesArray = bytes as? [UInt8] {
            let reData = Data(bytesArray)
            print("收到要发送的数据： \(reData.hexEncodedString())")
        } else {
            print("收到数据错误")
        }
    }
}
