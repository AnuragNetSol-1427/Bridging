//
//  TimePickerIos.swift
//  Bridging
//
//  Created by Anurag on 10/06/24.
//

import Foundation
import UIKit
import React

@objc(TimePickerIos)
class TimePickerIos: NSObject {
  
  @objc
  func showTimePicker(_ callback: @escaping RCTResponseSenderBlock) {
    DispatchQueue.main.async {
      guard let rootViewController = UIApplication.shared.windows.filter({ $0.isKeyWindow }).first?.rootViewController else {
        return
      }
      
      // Create the time picker
      let timePicker = UIDatePicker()
      timePicker.datePickerMode = .time
      
      if #available(iOS 14.0, *) {
        timePicker.preferredDatePickerStyle = .inline
      }

      // Create the alert controller
      let alert = UIAlertController(title: "Select Time", message: nil, preferredStyle: .actionSheet)
      
      // Add the time picker to the alert controller
      alert.view.addSubview(timePicker)
      
      // Create "Select Time" button
      let selectTimeButton = UIButton(type: .system)
      selectTimeButton.setTitle("Select Time", for: .normal)
      selectTimeButton.setTitleColor(UIColor.systemBlue, for: .normal)
      selectTimeButton.backgroundColor = timePicker.backgroundColor
      selectTimeButton.layer.cornerRadius = 8
      selectTimeButton.titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
      selectTimeButton.contentEdgeInsets = UIEdgeInsets(top: 12, left: 24, bottom: 12, right: 24)
      alert.view.addSubview(selectTimeButton)
      
      // Create "Cancel" button
      let cancelButton = UIButton(type: .system)
      cancelButton.setTitle("Cancel", for: .normal)
      cancelButton.setTitleColor(UIColor.systemRed, for: .normal)
      cancelButton.backgroundColor = timePicker.backgroundColor
      cancelButton.layer.cornerRadius = 8
      cancelButton.titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
      cancelButton.contentEdgeInsets = UIEdgeInsets(top: 12, left: 24, bottom: 12, right: 24)
      alert.view.addSubview(cancelButton)

      // Setup the buttons to call the appropriate callback when tapped
      selectTimeButton.addTarget(self, action: #selector(self.selectTimeButtonTapped(_:)), for: .touchUpInside)
      cancelButton.addTarget(self, action: #selector(self.cancelButtonTapped(_:)), for: .touchUpInside)
      self.callback = callback
      self.timePicker = timePicker
      self.parentViewController = rootViewController

      // Add constraints for the time picker within the alert controller's view
      timePicker.translatesAutoresizingMaskIntoConstraints = false
      NSLayoutConstraint.activate([
        timePicker.topAnchor.constraint(equalTo: alert.view.topAnchor, constant: 20),
        timePicker.leadingAnchor.constraint(equalTo: alert.view.leadingAnchor),
        timePicker.trailingAnchor.constraint(equalTo: alert.view.trailingAnchor),
        timePicker.bottomAnchor.constraint(equalTo: alert.view.bottomAnchor, constant: -100)
      ])
      
      // Add constraints for the "Select Time" button
      selectTimeButton.translatesAutoresizingMaskIntoConstraints = false
      NSLayoutConstraint.activate([
        selectTimeButton.topAnchor.constraint(equalTo: timePicker.bottomAnchor, constant: 10),
        selectTimeButton.centerXAnchor.constraint(equalTo: alert.view.centerXAnchor)
      ])
      
      // Add constraints for the "Cancel" button
      cancelButton.translatesAutoresizingMaskIntoConstraints = false
      NSLayoutConstraint.activate([
        cancelButton.topAnchor.constraint(equalTo: selectTimeButton.bottomAnchor, constant: 10),
        cancelButton.centerXAnchor.constraint(equalTo: alert.view.centerXAnchor),
        cancelButton.bottomAnchor.constraint(equalTo: alert.view.bottomAnchor)
      ])
      
      // Present the alert controller
      rootViewController.present(alert, animated: true, completion: nil)
    }
  }
  
  // Hold references to the callback and time picker
  private var callback: RCTResponseSenderBlock?
  private var timePicker: UIDatePicker?
  private var parentViewController: UIViewController?
  
  @objc private func selectTimeButtonTapped(_ sender: UIButton) {
    guard let timePicker = timePicker, let callback = callback else { return }
    let dateFormatter = DateFormatter()
//    dateFormatter.dateFormat = "HH:mm" // Adjust time format as needed
    dateFormatter.dateFormat = "h:mm a"
    let time = dateFormatter.string(from: timePicker.date)
    callback([time])
    parentViewController?.dismiss(animated: true, completion: nil)
  }
  
  @objc private func cancelButtonTapped(_ sender: UIButton) {
    parentViewController?.dismiss(animated: true, completion: nil)
  }
}
