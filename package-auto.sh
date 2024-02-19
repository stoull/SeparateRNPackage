#!/bin/bash

npx react-native bundle --entry-file='index.js' --bundle-output='./ios/bundle/index.jsbundle' --dev=false --platform='ios'

npx react-native bundle --entry-file='index-base.js' --bundle-output='./ios/bundle/base.jsbundle' --dev=false --platform='ios'

npx react-native bundle --entry-file='index-infinity2000.js' --bundle-output='./ios/bundle/infinity2000.jsbundle' --dev=false --platform='ios'

npx react-native bundle --entry-file='index-inverterkit.js' --bundle-output='./ios/bundle/inverterkit.jsbundle' --dev=false --platform='ios'
