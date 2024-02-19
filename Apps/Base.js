import React, { Component } from 'react';
import {StyleSheet, Text, SafeAreaView} from 'react-native';

export default class Base extends Component {
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