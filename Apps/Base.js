import React, { Component } from 'react';
import {StyleSheet, Text, SafeAreaView} from 'react-native';

import { NativeModules, NativeEventEmitter} from 'react-native';

// 引入原生模块,进行回调操作
const baseCallBack = NativeModules.RNBase;
// 数据订阅推送
const dataUpdater = new NativeEventEmitter(NativeModules.RNBase);

// 原生调用的不同方法类型
const FunctionType = Object.freeze({
  // 查询设备信息
  inquiryDeviceInfo: 'INQUIRY-DEVICE-INFO',
  // 查询设备升级信息
  checkUpdate: 'INQUIRY-DEVICE-UPDATE'
})

/*
  开始接收原生调用方法的请求
*/
export const startDataReceiving = () => {

  dataUpdater.addListener(FunctionType.inquiryDeviceInfo, function(data) {
    console.log('====== 原生方法调用 查询设备信息 方法 ====== \n');
    console.log(data);

    // 回调结果给原生
    baseCallBack.inquiryDeviceInfoCallBack(JSON.stringify({type:'Infinity200', sn: 'XCM0DCG00Q'}));
  });

  dataUpdater.addListener(FunctionType.checkUpdate, function(data) {
    console.log('====== 原生方法调用 查询设备升级信息 方法 ====== \n');
    console.log(data);

    // 回调结果给原生
    baseCallBack.checkUpdateCallBack(JSON.stringify({needsUpdate:'0', version: '1.2.0'}));
  });

  // dataUpdater.removeEventListener(FunctionType.inquiryDeviceInfo, '');
  // dataUpdater.removeEventListener(FunctionType.checkUpdate, '');
};

export class Base extends Component {

  render() {
      return null;
  }
}

export const baseModuleMethod = () => {
  const logMsg = {message: "This message from Base Module", args: 'arg1, arg2'};
  console.log(logMsg);
  return logMsg;
}