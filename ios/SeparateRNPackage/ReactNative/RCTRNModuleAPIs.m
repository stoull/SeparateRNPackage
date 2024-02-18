//
//  RCTRNModuleAPIs.m
//  MyGro
//
//  Created by hut on 2023/12/25.
//

#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>

@interface

RCT_EXTERN_MODULE(RNNetworkManager, NSObject)

// 调用api接口 使用promise
RCT_EXTERN_METHOD(myGroServer:(NSString *)method path:(NSString *)path params:(NSString *)params resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject)
RCT_EXTERN_METHOD(postMygroServer:(NSString *)path params:(NSString *)params resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject)
RCT_EXTERN_METHOD(getMygroServer:(NSString *)path params:(NSString *)params resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject)
@end

@interface
RCT_EXTERN_MODULE(RNDevice, NSObject)
// 当前是否是有网络连接
RCT_EXTERN_METHOD(isCurrentedToNetwork:(RCTResponseSenderBlock)callback)
// 当前是否是使用WiFi网络
RCT_EXTERN_METHOD(isCurrentConnectToWiFi:(RCTResponseSenderBlock)callback)
// 获取当前系统连接的WiFi名称
RCT_EXTERN_METHOD(currentWiFiName:(RCTResponseSenderBlock)callback)
//RCT_EXTERN_METHOD(exampleMethod:(NSString *)params date:(nonnull NSNumber *)date)
//
//RCT_EXTERN_METHOD(exampleCallbackMethod:(NSString *)title index:(nonnull NSNumber *)index callback:(RCTResponseSenderBlock)callback)
//
@end

@interface
RCT_EXTERN_MODULE(RNLogger, NSObject)

/// 增加一条设备操作记录
RCT_EXTERN_METHOD(addDeviceOperateRecord:(NSString *)sn setType:(NSString *)setType setValue:(NSString *)setValue)
//RCT_EXTERN_METHOD(exampleCallbackMethod:(NSString *)title index:(nonnull NSNumber *)index callback:(RCTResponseSenderBlock)callback)
//
@end

@interface
RCT_EXTERN_MODULE(RNBluetooth, NSObject)

/// 发送数据
RCT_EXTERN_METHOD(sendByteData:(NSString *)sendId date:(NSArray *)bytes)

//RCT_EXTERN_METHOD(exampleMethod:(NSString *)params date:(nonnull NSNumber *)date)
//
//RCT_EXTERN_METHOD(exampleCallbackMethod:(NSString *)title index:(nonnull NSNumber *)index callback:(RCTResponseSenderBlock)callback)
//
@end

@interface
RCT_EXTERN_MODULE(RNDeviceDataUpdater, RCTEventEmitter)
/**
 开始自启刷新数据
 type:
 0: Infinity 1500
 1: Vita 550
 2: Infinity 1300
 3: Infinity 2000
 4: Infinity 1300 pro
 */
RCT_EXTERN_METHOD(startUpdate:(NSString *)sn type:(nonnull NSNumber *)type)
RCT_EXTERN_METHOD(stopUpdate)
//
@end
