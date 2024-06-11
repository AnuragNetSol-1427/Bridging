//
//  DateTimeBothPickerIos.swift
//  Bridging
//
//  Created by Anurag on 10/06/24.
//

import Foundation
import UIKit
import React

@objc(DateTimeBothPickerIos)
class DateTimeBothPickerIos: NSObject {
  
  @objc
  func showDateTimePicker(_ callback: @escaping RCTResponseSenderBlock) {
    DispatchQueue.main.async {
      guard let rootViewController = UIApplication.shared.windows.filter({ $0.isKeyWindow }).first?.rootViewController else {
        return
      }
      
      // Create the date and time picker
      let dateTimePicker = UIDatePicker()
      dateTimePicker.datePickerMode = .dateAndTime
      
      if #available(iOS 14.0, *) {
        dateTimePicker.preferredDatePickerStyle = .inline
      }

      // Create the alert controller
      let alert = UIAlertController(title: "Select Date and Time", message: nil, preferredStyle: .actionSheet)
      
      // Add the date and time picker to the alert controller
      alert.view.addSubview(dateTimePicker)
      
      // Create "Select Date and Time" button
      let selectDateTimeButton = UIButton(type: .system)
      selectDateTimeButton.setTitle("Select Date and Time", for: .normal)
      selectDateTimeButton.setTitleColor(UIColor.systemBlue, for: .normal)
      selectDateTimeButton.backgroundColor = dateTimePicker.backgroundColor
      selectDateTimeButton.layer.cornerRadius = 8
      selectDateTimeButton.titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
      selectDateTimeButton.contentEdgeInsets = UIEdgeInsets(top: 12, left: 24, bottom: 12, right: 24)
      alert.view.addSubview(selectDateTimeButton)
      
      // Create "Cancel" button
      let cancelButton = UIButton(type: .system)
      cancelButton.setTitle("Cancel", for: .normal)
      cancelButton.setTitleColor(UIColor.systemRed, for: .normal)
      cancelButton.backgroundColor = dateTimePicker.backgroundColor
      cancelButton.layer.cornerRadius = 8
      cancelButton.titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
      cancelButton.contentEdgeInsets = UIEdgeInsets(top: 12, left: 24, bottom: 12, right: 24)
      alert.view.addSubview(cancelButton)

      // Setup the buttons to call the appropriate callback when tapped
      selectDateTimeButton.addTarget(self, action: #selector(self.selectDateTimeButtonTapped(_:)), for: .touchUpInside)
      cancelButton.addTarget(self, action: #selector(self.cancelButtonTapped(_:)), for: .touchUpInside)
      self.callback = callback
      self.dateTimePicker = dateTimePicker
      self.parentViewController = rootViewController

      // Add constraints for the date and time picker within the alert controller's view
      dateTimePicker.translatesAutoresizingMaskIntoConstraints = false
      NSLayoutConstraint.activate([
        dateTimePicker.topAnchor.constraint(equalTo: alert.view.topAnchor, constant: 20),
        dateTimePicker.leadingAnchor.constraint(equalTo: alert.view.leadingAnchor),
        dateTimePicker.trailingAnchor.constraint(equalTo: alert.view.trailingAnchor),
        dateTimePicker.bottomAnchor.constraint(equalTo: alert.view.bottomAnchor, constant: -100)
      ])
      
      // Add constraints for the "Select Date and Time" button
      selectDateTimeButton.translatesAutoresizingMaskIntoConstraints = false
      NSLayoutConstraint.activate([
        selectDateTimeButton.topAnchor.constraint(equalTo: dateTimePicker.bottomAnchor, constant: 10),
        selectDateTimeButton.centerXAnchor.constraint(equalTo: alert.view.centerXAnchor)
      ])
      
      // Add constraints for the "Cancel" button
      cancelButton.translatesAutoresizingMaskIntoConstraints = false
      NSLayoutConstraint.activate([
        cancelButton.topAnchor.constraint(equalTo: selectDateTimeButton.bottomAnchor, constant: 10),
        cancelButton.centerXAnchor.constraint(equalTo: alert.view.centerXAnchor),
        cancelButton.bottomAnchor.constraint(equalTo: alert.view.bottomAnchor)
      ])
      
      // Present the alert controller
      rootViewController.present(alert, animated: true, completion: nil)
    }
  }
  
  // Hold references to the callback and date and time picker
  private var callback: RCTResponseSenderBlock?
  private var dateTimePicker: UIDatePicker?
  private var parentViewController: UIViewController?
  
  @objc private func selectDateTimeButtonTapped(_ sender: UIButton) {
    guard let dateTimePicker = dateTimePicker, let callback = callback else { return }
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm" // Adjust date and time format as needed
    let dateTime = dateFormatter.string(from: dateTimePicker.date)
    callback([dateTime])
    parentViewController?.dismiss(animated: true, completion: nil)
  }
  
  @objc private func cancelButtonTapped(_ sender: UIButton) {
    parentViewController?.dismiss(animated: true, completion: nil)
  }
}
