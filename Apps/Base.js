import React, { Component } from 'react';
import {StyleSheet, Text, SafeAreaView} from 'react-native';

import { NativeModules, NativeEventEmitter} from 'react-native';

// 引入原生模块,进行回调操作
const baseCallBack = NativeModules.RNBase;

// 数据订阅推送
const dataUpdater = new NativeEventEmitter(NativeModules.RNDeviceDataUpdater);

/*
  开始接收数据
*/
const startDataReceiving = () => {
  console.log('====== 原生方法调用 ====== \n');
  // dataUpdater.addListener('INQUIRY-DEVICE-INFO', data => console.log(data));
  dataUpdater.addListener('INQUIRY-DEVICE-INFO', function(data) {
    console.log('====== 原生方法调用参数 ====== \n');
    console.log(data);

    // 回调结果给原生
    baseCallBack.inquiryDeviceInfoCallBack(JSON.stringify({type:'Infinity200', sn: 'XCM0DCG00Q'}));
  });

  // RNDeviceDataUpdater.stopUpdate()
  // dataUpdater.removeEventListener('SUBSCRIBE', '');
};

class Base extends Component {

  render() {
      return (
        <SafeAreaView style={styles.container}>
          <Text style={styles.text}>Here is Base module</Text>
        </SafeAreaView>
      );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  text: {
    fontSize: 25,
    fontWeight: '500',
  },
});

function TestMethod(args) {
  console.log('TestMethod', args);
}

export default Base;