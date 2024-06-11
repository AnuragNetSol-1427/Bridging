import { SafeAreaView, StyleSheet, Platform } from 'react-native'
import React from 'react'
import Toast from './src/containers/Toast'
import DatePicker from './src/containers/DatePicker'
import TimePicker from './src/containers/TimePicker'
import DateTimeBothPickerIos from './src/containers/DateTimeBothPicker'



const App = () => {
  return (
    <SafeAreaView style={styles.container}>
      <Toast />
      <DatePicker />
      <TimePicker />
      {Platform.OS === 'ios' && <DateTimeBothPickerIos />}
    </SafeAreaView>
  )
}

export default App

const styles = StyleSheet.create({
  container: {
    // borderWidth: 1,
    // borderColor: 'orange',
    flex: 1,
    justifyContent: 'space-around',
    alignItems: 'center'
  },
})