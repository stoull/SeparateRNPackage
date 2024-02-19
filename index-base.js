import { AppRegistry } from 'react-native';

import AppBase from './Apps/Base';
import { base as appName } from './app.json';


AppRegistry.registerComponent(appName, () => AppBase);