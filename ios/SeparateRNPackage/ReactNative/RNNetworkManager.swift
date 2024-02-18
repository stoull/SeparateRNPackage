//
//  RNNetworkManager.swift
//  MyGro
//
//  Created by Stoull Hut on 2023/12/13.
//

import Foundation
import React

@objc(RNNetworkManager)
class RNNetworkManager: NSObject {
    // 网络API相关
    @objc(myGroServer:path:params:resolver:rejecter:)
    func myGroServer(method: String, path: NSString, params: NSString, resolver: @escaping RCTPromiseResolveBlock, rejecter: @escaping RCTPromiseRejectBlock) {
        guard let paramsDic = JSON(parseJSON: params as String).dictionaryObject else {
            rejecter(NSLocalizedString("失败", comment: ""), nil, nil)
            return
        }
        debugPrint("postMygroServer path: \(path), params: \(params)")
        let router = MGDeviceCPPowerRouter.custom(path: path as String, params: paramsDic, method: method)
        MGNetworkManager.requestJsonData(router) { res in
            if res.code == 1,
               let resDic = res.jsonObject.dictionaryObject {
                resolver(JSON(resDic).rawString())
            } else {
                rejecter(NSLocalizedString("失败", comment: ""), res.message, nil)
            }
        }
    }
    
    @objc(postMygroServer:params:resolver:rejecter:)
    func postMygroServer(path: NSString, params: NSString, resolver: @escaping RCTPromiseResolveBlock, rejecter: @escaping RCTPromiseRejectBlock) {
        guard let paramsDic = JSON(parseJSON: params as String).dictionaryObject else {
            rejecter(NSLocalizedString("失败", comment: ""), nil, nil)
            return
        }
        debugPrint("postMygroServer path: \(path), params: \(params)")
        let router = MGDeviceCPPowerRouter.custom(path: path as String, params: paramsDic, method: "POST")
        MGNetworkManager.requestJsonData(router) { res in
            if res.code == 1,
               let resDic = res.jsonObject.dictionaryObject {
                resolver(JSON(resDic).rawString())
            } else {
                rejecter(NSLocalizedString("失败", comment: ""), res.message, nil)
            }
        }
    }
    
    // 网络API相关
    @objc(getMygroServer:params:resolver:rejecter:)
    func getMygroServer(path: NSString, params: NSString, resolver: @escaping RCTPromiseResolveBlock, rejecter: @escaping RCTPromiseRejectBlock) {
        guard let paramsDic = JSON(parseJSON: params as String).dictionaryObject else {
            rejecter(NSLocalizedString("失败", comment: ""), nil, nil)
            return
        }
        debugPrint("postMygroServer path: \(path), params: \(params)")
        let router = MGDeviceCPPowerRouter.custom(path: path as String, params: paramsDic, method: "GET")
        MGNetworkManager.requestJsonData(router) { res in
            if res.code == 1,
               let resDic = res.jsonObject.dictionaryObject {
                resolver(JSON(resDic).rawString())
            } else {
                rejecter(NSLocalizedString("失败", comment: ""), res.message, nil)
            }
        }
    }
    
    
    @objc
    static func requiresMainQueueSetup() -> Bool {
        // true if we need this class initialized on the main thread
        // false if the class can be initialized on a background thread
        return false
    }
    
    @objc
    func constantsToExport() -> [AnyHashable : Any]! {
        // 常量 expose static Swift data
        let username = MGAuthenticator.share.currentUser.uid
        let authToken = MGAuthenticator.share.currentCpowerAuthToken?.tokenString ?? ""
        return ["authorization": authToken,
                "username": username, "host": kServerHost_myGro]
    }
    
}
