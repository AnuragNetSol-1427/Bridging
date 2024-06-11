import { Text, Pressable, StyleSheet, Platform } from 'react-native'
import React from 'react'
import { ToastIos, ToastModule } from '../../NativeModules'

const index = () => {    
    const onPressBtnToastOpen = () => {
        Platform.OS == 'android' && ToastModule.openToast("Toast is here")
        Platform.OS == 'ios' && ToastIos.openToast("iOS Toast is here")
    }
    return (
        <Pressable style={styles.btnContainer} onPress={() => onPressBtnToastOpen()}>
            <Text style={styles.btnText}>Open Toast</Text>
        </Pressable>
    )
}

export default index

const styles = StyleSheet.create({
    btnContainer: {
        borderWidth: 1,
        padding: 10,
        borderRadius: 10
    },
    btnText: {
        color: 'black'
    }
})