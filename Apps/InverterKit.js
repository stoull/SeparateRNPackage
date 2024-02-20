import React, { Component } from 'react';

import { NativeModules, NativeEventEmitter} from 'react-native';

import {Base, baseModuleMethod} from './Base';

const inverterkit = require("inverterkit");

// 引入原生模块,进行回调操作
const baseCallBack = NativeModules.RNBase;
// 数据订阅推送
const dataUpdater = new NativeEventEmitter(NativeModules.RNBase);

// 原生调用的不同方法类型
const FunctionType = Object.freeze({
  // 使用多包时，调用Addtional包的方法
  addtionalFunction: "Addtional-Function"
})

/*
  开始接收原生调用方法的请求
*/
export const startDataReceiving = () => {
  dataUpdater.addListener(FunctionType.addtionalFunction, function(data) {
    console.log('====== 原生方法调用 调用Addtional包的方法 方法 ====== \n');
    console.log(data);

    // 回调结果给原生
    const resultString = baseModuleMethod()
    baseCallBack.addtionalFunction(JSON.stringify(resultString));
  });

  // dataUpdater.removeEventListener(FunctionType.inquiryDeviceInfo, '');
  // dataUpdater.removeEventListener(FunctionType.checkUpdate, '');
};

export default class InverterKit extends Component {
  render() {
      return null;
  }
}