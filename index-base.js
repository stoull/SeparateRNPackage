import { AppRegistry } from 'react-native';

import {Base, startDataReceiving, baseModuleMethod} from './Apps/Base';
import { base as appName } from './app.json';

AppRegistry.registerComponent(appName, () => Base);

// 开始接收原生调用方法的请求
startDataReceiving();

// he  require('BatchedBridge')  method is no longer supported in React Native versions 0.60 and above.
// Instead of using  BatchedBridge , the recommended approach for communication between JavaScript and native code in newer versions of React Native is to use the  NativeModules  module.
// const BatchedBridge = require('BatchedBridge');
// BatchedBridge.registerCallableModule('Base', {
//   TestMethod:function(){
//         console.log("TestMethod xxxxxx");
//     }
// });