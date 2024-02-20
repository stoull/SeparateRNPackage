import { AppRegistry } from 'react-native';

import {InverterKit, startDataReceiving} from './Apps/InverterKit';
import { inverterkit as appName } from './app.json';

AppRegistry.registerComponent(appName, () => InverterKit);

// 开始接收原生调用方法的请求
startDataReceiving();