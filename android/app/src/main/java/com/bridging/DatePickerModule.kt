//package com.bridging
//
//import com.facebook.react.bridge.NativeModule
//import com.facebook.react.bridge.ReactApplicationContext
//import com.facebook.react.bridge.ReactContext
//import com.facebook.react.bridge.ReactContextBaseJavaModule
//import com.facebook.react.bridge.ReactMethod
//import android.util.Log
//import android.widget.DatePicker
//import android.app.DatePickerDialog
//import android.icu.util.Calendar
//import android.os.Build
//import androidx.annotation.RequiresApi
//import java.text.SimpleDateFormat
//import java.util.Locale
//
//class DatePickerModule(private val reactContext: ReactApplicationContext) : ReactContextBaseJavaModule(reactContext) {
//    override fun getName():String {
//        return "DatePickerModule"
//    }
//
//    @RequiresApi(Build.VERSION_CODES.N)
//    private val calendar = Calendar.getInstance()
//
//    @RequiresApi(Build.VERSION_CODES.N)
//    private val tvSelectedDate = Calendar.getInstance()
//
//    @RequiresApi(Build.VERSION_CODES.N)
//    @ReactMethod
//    fun openDatePicker() {
////        val calendar = Calendar.getInstance()
//        val datePickerDialog = DatePickerDialog(
//            reactContext, {DatePicker, year: Int, monthOfYear: Int, dayOfMonth: Int ->
//                // Create a new Calendar instance to hold the selected date
//                val selectedDate = Calendar.getInstance()
//                // Set the selected date using the values received from the DatePicker dialog
//                selectedDate.set(year, monthOfYear, dayOfMonth)
//                // Create a SimpleDateFormat to format the date as "dd/MM/yyyy"
//                val dateFormat = SimpleDateFormat("dd/MM/yyyy", Locale.getDefault())
//                // Format the selected date into a string
//                val formattedDate = dateFormat.format(selectedDate.time)
//                // Update the TextView to display the selected date with the "Selected Date: " prefix
////                tvSelectedDate = "Selected Date: $formattedDate"
//            },
//            calendar.get(Calendar.YEAR),
//            calendar.get(Calendar.MONTH),
//            calendar.get(Calendar.DAY_OF_MONTH)
//        )
//        // Show the DatePicker dialog
//        datePickerDialog.show()
//    }
//}



//class ToastModule(private val reactContext: ReactApplicationContext) : ReactContextBaseJavaModule(reactContext) {
//
//    override fun getName():String {
//        return "ToastModule"
//    }
//
//    @ReactMethod
//    fun openToast(message: String) {
//        val toast = Toast.makeText(reactContext, message, Toast.LENGTH_SHORT)
//        toast.setGravity(Gravity.CENTER, 0, 0)
//        toast.show()
//    }
//}

package com.bridging

import android.app.DatePickerDialog
import android.widget.DatePicker
import com.facebook.react.bridge.*
import com.facebook.react.modules.core.DeviceEventManagerModule
import java.util.*

class DatePickerModule(reactContext: ReactApplicationContext) : ReactContextBaseJavaModule(reactContext), ActivityEventListener {

    init {
        reactContext.addActivityEventListener(this)
    }

    override fun getName(): String {
        return "DatePickerModule"
    }

    @ReactMethod
    fun showDatePicker(callback: Callback) {
        val activity = currentActivity ?: return

        val calendar = Calendar.getInstance()
        val year = calendar.get(Calendar.YEAR)
        val month = calendar.get(Calendar.MONTH)
        val day = calendar.get(Calendar.DAY_OF_MONTH)

        val datePickerDialog = DatePickerDialog(activity, { _: DatePicker, selectedYear: Int, selectedMonth: Int, selectedDay: Int ->
            val date = "$selectedDay/${selectedMonth + 1}/$selectedYear"
            callback.invoke(date)
        }, year, month, day)

        datePickerDialog.show()
    }

    override fun onNewIntent(intent: android.content.Intent?) {}

    override fun onActivityResult(activity: android.app.Activity?, requestCode: Int, resultCode: Int, data: android.content.Intent?) {}
}
