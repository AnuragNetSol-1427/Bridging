import { View, Text, StyleSheet, Pressable, Platform } from 'react-native'
import React, { useState } from 'react'
import { DateTimeBothPickerIos } from '../../NativeModules'

const index = () => {
    const [selectedDateTime, setSelectedDateTime] = useState(null);

    const onPressBtnDateTimePickerOpen = () => {
        Platform.OS == 'ios' && DateTimeBothPickerIos.showDateTimePicker((res) => {
            setSelectedDateTime(res);
          });
    }
    return (
        <View style={{ borderWidth: 1, borderColor: 'black', alignItems: 'center' }}>
            <Pressable style={styles.btnContainer} onPress={() => onPressBtnDateTimePickerOpen()}>
                <Text style={styles.btnText}>Open Date and Time Picker</Text>
            </Pressable>
            {
                selectedDateTime &&
                <View>
                    <Text style={styles.dateText}>{selectedDateTime ?? selectedDateTime}</Text>
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