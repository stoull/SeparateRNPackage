//
//  RNModuleAPIs.m
//  SeparateRNPackage
//
//  Created by Hut Chen on 2024/2/19.
//

#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>

@interface
RCT_EXTERN_MODULE(RNBase, RCTEventEmitter)
RCT_EXTERN_METHOD(inquiryDeviceInfoCallBack:(NSString *)infoJSON)
@end

@interface
RCT_EXTERN_MODULE(RNCallback, NSObject)
// 当前是否是有网络连接
RCT_EXTERN_METHOD(isCurrentedToNetwork:(RCTResponseSenderBlock)callback)
// 当前是否是使用WiFi网络
RCT_EXTERN_METHOD(isCurrentConnectToWiFi:(RCTResponseSenderBlock)callback)
// 获取当前系统连接的WiFi名称
RCT_EXTERN_METHOD(currentWiFiName:(RCTResponseSenderBlock)callback)
@end
