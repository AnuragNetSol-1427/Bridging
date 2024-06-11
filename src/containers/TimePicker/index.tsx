import { View, Text, Pressable, StyleSheet, Platform } from 'react-native'
import React, { useState } from 'react'
import { TimePickerModule, TimePickerIos } from '../../NativeModules'

const index = () => {
    const [selectedTime, setSelectedTime] = useState(null);

    const onPressBtnTimePickerOpen = () => {
        Platform.OS == 'android' ?  TimePickerModule.showTimePicker((time) => {
            setSelectedTime(time);
          })
          :
          TimePickerIos.showTimePicker((time) => {
            setSelectedTime(time);
          });
    }

    return (
        <View style={{ borderWidth: 1, borderColor: 'black', alignItems: 'center' }}>
            <Pressable style={styles.btnContainer} onPress={() => onPressBtnTimePickerOpen()}>
                <Text style={styles.btnText}>Open Time Picker</Text>
            </Pressable>
            {
                selectedTime &&
                <View>
                    <Text style={styles.dateText}>{selectedTime ?? selectedTime}</Text>
                </View>
            }
        </View>
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
    },
    dateText: {
        color: 'black'
    }
})