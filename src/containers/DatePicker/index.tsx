import { View, Text, StyleSheet, Pressable, Platform } from 'react-native'
import React, { useState } from 'react'
import { DatePickerModule, DatePickerIos } from '../../NativeModules'

const index = () => {
    const [selectedDate, setSelectedDate] = useState(null);

    const onPressBtnDatePickerOpen = () => {
        Platform.OS == 'android' ? DatePickerModule.showDatePicker((date) => {
            setSelectedDate(date);
        })
        : 
        DatePickerIos.showDatePicker((date) => {
            setSelectedDate(date);
          });
    }
    return (
        <View style={styles.parentContainer}>
            <Pressable style={styles.btnContainer} onPress={() => onPressBtnDatePickerOpen()}>
                <Text style={styles.btnText}>Open Date Picker</Text>
            </Pressable>
            {
                selectedDate &&
                <View>
                    <Text style={styles.dateText}>{selectedDate ?? selectedDate}</Text>
                </View>
            }
        </View>
    )
}

export default index

const styles = StyleSheet.create({
    parentContainer: { 
        // borderWidth: 1, 
        // borderColor: 'black', 
        alignItems: 'center' 
    },
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