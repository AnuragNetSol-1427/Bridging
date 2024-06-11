// TimePickerModule.kt

package com.bridging

import android.app.TimePickerDialog
import android.widget.TimePicker
import com.facebook.react.bridge.*
import com.facebook.react.modules.core.DeviceEventManagerModule
import java.util.*

class TimePickerModule(reactContext: ReactApplicationContext) : ReactContextBaseJavaModule(reactContext), ActivityEventListener {

    init {
        reactContext.addActivityEventListener(this)
    }

    override fun getName(): String {
        return "TimePickerModule"
    }

    @ReactMethod
    fun showTimePicker(callback: Callback) {
        val activity = currentActivity ?: return

        val calendar = Calendar.getInstance()
        val hour = calendar.get(Calendar.HOUR_OF_DAY)
        val minute = calendar.get(Calendar.MINUTE)

//        val timePickerDialog = TimePickerDialog(activity, { _: TimePicker, selectedHour: Int, selectedMinute: Int ->
//            val time = String.format("%02d:%02d", selectedHour, selectedMinute)
//            callback.invoke(time)
//        }, hour, minute, true)
        val timePickerDialog = TimePickerDialog(activity, { _: TimePicker, selectedHour: Int, selectedMinute: Int ->
            val amPm = if (selectedHour < 12) "AM" else "PM"
            val formattedHour = if (selectedHour % 12 == 0) 12 else selectedHour % 12
            val time = String.format("%02d:%02d %s", formattedHour, selectedMinute, amPm)
            callback.invoke(time)
        }, hour, minute, false)

        timePickerDialog.show()
    }

    override fun onNewIntent(intent: android.content.Intent?) {}

    override fun onActivityResult(activity: android.app.Activity?, requestCode: Int, resultCode: Int, data: android.content.Intent?) {}
}
