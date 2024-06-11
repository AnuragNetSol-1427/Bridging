//
//  DatePickerIos.swift
//  Bridging
//
//  Created by Anurag on 10/06/24.
//

//import Foundation
//import UIKit
//import React
//
//@objc(DatePickerIos)
//class DatePickerIos: NSObject {
//
//  @objc
//  func showDatePicker(_ callback: @escaping RCTResponseSenderBlock) {
//    DispatchQueue.main.async {
//      guard let rootViewController = UIApplication.shared.windows.filter({ $0.isKeyWindow }).first?.rootViewController else {
//        return
//      }
//      
//      // Create the date picker
//      let datePicker = UIDatePicker()
//      datePicker.datePickerMode = .date
//      
//      if #available(iOS 14.0, *) {
//        datePicker.preferredDatePickerStyle = .inline
//      }
//
//      // Create the alert controller
//      let alert = UIAlertController(title: "Select Date", message: nil, preferredStyle: .actionSheet)
//      
//      // Add the date picker to the alert controller
//      alert.view.addSubview(datePicker)
//      
//      // Create a view for the buttons
//      let buttonContainerView = UIView()
//      alert.view.addSubview(buttonContainerView)
//      
//      // Create "Select Date" and "Cancel" buttons
//      let selectDateButton = UIButton(type: .system)
//      selectDateButton.setTitle("Select Date", for: .normal)
//      selectDateButton.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .regular)
//      selectDateButton.setTitleColor(UIColor.systemBlue, for: .normal)
//      selectDateButton.addTarget(self, action: #selector(self.selectDateButtonTapped(_:)), for: .touchUpInside)
//      
//      let cancelButton = UIButton(type: .system)
//      cancelButton.setTitle("Cancel", for: .normal)
//      cancelButton.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .regular)
//      cancelButton.setTitleColor(UIColor.systemRed, for: .normal)
//      cancelButton.addTarget(self, action: #selector(self.cancelButtonTapped(_:)), for: .touchUpInside)
//      
//      // Add buttons to the button container view
//      buttonContainerView.addSubview(selectDateButton)
//      buttonContainerView.addSubview(cancelButton)
//
//      // Setup the buttons to call the appropriate callback when tapped
//      self.callback = callback
//      self.datePicker = datePicker
//      self.parentViewController = rootViewController
//
//      // Add constraints for the date picker within the alert controller's view
//      datePicker.translatesAutoresizingMaskIntoConstraints = false
//      NSLayoutConstraint.activate([
//        datePicker.topAnchor.constraint(equalTo: alert.view.topAnchor, constant: 20),
//        datePicker.leadingAnchor.constraint(equalTo: alert.view.leadingAnchor),
//        datePicker.trailingAnchor.constraint(equalTo: alert.view.trailingAnchor),
//        datePicker.heightAnchor.constraint(equalTo: alert.view.heightAnchor)
//      ])
//      
//      // Add constraints for the button container view
//      buttonContainerView.translatesAutoresizingMaskIntoConstraints = false
//      NSLayoutConstraint.activate([
//        buttonContainerView.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 10),
//        buttonContainerView.leadingAnchor.constraint(equalTo: alert.view.leadingAnchor),
//        buttonContainerView.trailingAnchor.constraint(equalTo: alert.view.trailingAnchor),
//        buttonContainerView.bottomAnchor.constraint(equalTo: alert.view.bottomAnchor, constant: -10)
//      ])
//
//      // Add constraints for the buttons within the button container view
//      selectDateButton.translatesAutoresizingMaskIntoConstraints = false
//      cancelButton.translatesAutoresizingMaskIntoConstraints = false
//      NSLayoutConstraint.activate([
//        selectDateButton.centerXAnchor.constraint(equalTo: buttonContainerView.centerXAnchor),
//        selectDateButton.topAnchor.constraint(equalTo: buttonContainerView.topAnchor, constant: 10),
//        selectDateButton.heightAnchor.constraint(equalTo: buttonContainerView.heightAnchor),
//        
//        cancelButton.centerXAnchor.constraint(equalTo: buttonContainerView.centerXAnchor),
//        cancelButton.topAnchor.constraint(equalTo: selectDateButton.bottomAnchor, constant: 10),
//        cancelButton.bottomAnchor.constraint(equalTo: buttonContainerView.bottomAnchor, constant: -10)
//      ])
//      
//      // Present the alert controller
//      rootViewController.present(alert, animated: true, completion: nil)
//    }
//  }
//  
//  // Hold references to the callback and date picker
//  private var callback: RCTResponseSenderBlock?
//  private var datePicker: UIDatePicker?
//  private var parentViewController: UIViewController?
//  
//  @objc private func selectDateButtonTapped(_ sender: UIButton) {
//    guard let datePicker = datePicker, let callback = callback else { return }
//    let dateFormatter = DateFormatter()
//    dateFormatter.dateFormat = "dd/MM/yyyy"
//    let date = dateFormatter.string(from: datePicker.date)
//    callback([date])
//    parentViewController?.dismiss(animated: true, completion: nil)
//  }
//  
//  @objc private func cancelButtonTapped(_ sender: UIButton) {
//    parentViewController?.dismiss(animated: true, completion: nil)
//  }
//}


//import Foundation
//import UIKit
//import React
//
//@objc(DatePickerIos)
//class DatePickerIos: NSObject {
//  
//  @objc
//  func showDatePicker(_ callback: @escaping RCTResponseSenderBlock) {
//    DispatchQueue.main.async {
//      guard let rootViewController = UIApplication.shared.windows.filter({ $0.isKeyWindow }).first?.rootViewController else {
//        return
//      }
//      
//      // Create the date picker
//      let datePicker = UIDatePicker()
//      datePicker.datePickerMode = .date
//      
//      if #available(iOS 14.0, *) {
//        datePicker.preferredDatePickerStyle = .inline
//      }
//
//      // Create the alert controller
//      let alert = UIAlertController(title: "Select Date", message: nil, preferredStyle: .actionSheet)
//      
//      // Add the date picker to the alert controller
//      alert.view.addSubview(datePicker)
//      
//      // Create a view for the buttons
//      let buttonContainerView = UIView()
//      alert.view.addSubview(buttonContainerView)
//      
//      // Create "Select Date" button
//      let selectDateButton = UIButton(type: .system)
//      selectDateButton.setTitle("Select Date", for: .normal)
//      selectDateButton.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .regular)
//      selectDateButton.setTitleColor(UIColor.systemBlue, for: .normal)
//      selectDateButton.addTarget(self, action: #selector(self.selectDateButtonTapped(_:)), for: .touchUpInside)
//      
//      // Add "Select Date" button to the button container view
//      buttonContainerView.addSubview(selectDateButton)
//
//      // Setup the button to call the appropriate callback when tapped
//      self.callback = callback
//      self.datePicker = datePicker
//      self.parentViewController = rootViewController
//
//      // Add constraints for the date picker within the alert controller's view
//      datePicker.translatesAutoresizingMaskIntoConstraints = false
//      NSLayoutConstraint.activate([
//        datePicker.topAnchor.constraint(equalTo: alert.view.topAnchor, constant: 20),
//        datePicker.leadingAnchor.constraint(equalTo: alert.view.leadingAnchor),
//        datePicker.trailingAnchor.constraint(equalTo: alert.view.trailingAnchor),
//        datePicker.heightAnchor.constraint(equalTo: alert.view.heightAnchor)
//      ])
//      
//      // Add constraints for the button container view
//      buttonContainerView.translatesAutoresizingMaskIntoConstraints = false
//      NSLayoutConstraint.activate([
//        buttonContainerView.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 10),
//        buttonContainerView.leadingAnchor.constraint(equalTo: alert.view.leadingAnchor),
//        buttonContainerView.trailingAnchor.constraint(equalTo: alert.view.trailingAnchor),
//        buttonContainerView.bottomAnchor.constraint(equalTo: alert.view.bottomAnchor, constant: -10)
//      ])
//
//      // Add constraints for the "Select Date" button within the button container view
//      selectDateButton.translatesAutoresizingMaskIntoConstraints = false
//      NSLayoutConstraint.activate([
//        selectDateButton.centerXAnchor.constraint(equalTo: buttonContainerView.centerXAnchor),
//        selectDateButton.topAnchor.constraint(equalTo: buttonContainerView.topAnchor, constant: 10),
//        selectDateButton.bottomAnchor.constraint(equalTo: buttonContainerView.bottomAnchor, constant: -10)
//      ])
//      
//      // Present the alert controller
//      rootViewController.present(alert, animated: true, completion: nil)
//    }
//  }
//  
//  // Hold references to the callback and date picker
//  private var callback: RCTResponseSenderBlock?
//  private var datePicker: UIDatePicker?
//  private var parentViewController: UIViewController?
//  
//  @objc private func selectDateButtonTapped(_ sender: UIButton) {
//    guard let datePicker = datePicker, let callback = callback else { return }
//    let dateFormatter = DateFormatter()
//    dateFormatter.dateFormat = "dd/MM/yyyy"
//    let date = dateFormatter.string(from: datePicker.date)
//    callback([date])
//    parentViewController?.dismiss(animated: true, completion: nil)
//  }
//}

//import Foundation
//import UIKit
//import React
//
//@objc(DatePickerIos)
//class DatePickerIos: NSObject {
//  
//  @objc
//  func showDatePicker(_ callback: @escaping RCTResponseSenderBlock) {
//    DispatchQueue.main.async {
//      guard let rootViewController = UIApplication.shared.windows.filter({ $0.isKeyWindow }).first?.rootViewController else {
//        return
//      }
//      
//      // Create the date picker
//      let datePicker = UIDatePicker()
//      datePicker.datePickerMode = .date
//      
//      if #available(iOS 14.0, *) {
//        datePicker.preferredDatePickerStyle = .inline
//      }
//
//      // Create the alert controller
//      let alert = UIAlertController(title: "Select Date", message: nil, preferredStyle: .actionSheet)
//      
//      // Add the date picker to the alert controller
//      alert.view.addSubview(datePicker)
//      
//      // Create "Select Date" button
//      let selectDateButton = UIButton(type: .system)
//      selectDateButton.setTitle("Select Date", for: .normal)
//      selectDateButton.setTitleColor(UIColor.systemBlue, for: .normal)
//      selectDateButton.backgroundColor = UIColor.white // Set background color to match the date picker
//      
//      // Set up button appearance
//      selectDateButton.layer.cornerRadius = 8
//      selectDateButton.layer.borderWidth = 1
//      selectDateButton.layer.borderColor = UIColor.systemBlue.cgColor
//      selectDateButton.contentEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20) // Adjust button padding
//      
//      // Add "Select Date" button to the alert controller
//      alert.view.addSubview(selectDateButton)
//
//      // Setup the button to call the appropriate callback when tapped
//      self.callback = callback
//      self.datePicker = datePicker
//      self.parentViewController = rootViewController
//
//      // Add constraints for the date picker within the alert controller's view
//      datePicker.translatesAutoresizingMaskIntoConstraints = false
//      NSLayoutConstraint.activate([
//        datePicker.topAnchor.constraint(equalTo: alert.view.topAnchor, constant: 20),
//        datePicker.leadingAnchor.constraint(equalTo: alert.view.leadingAnchor),
//        datePicker.trailingAnchor.constraint(equalTo: alert.view.trailingAnchor),
//        datePicker.heightAnchor.constraint(equalTo: alert.view.heightAnchor, multiplier: 0.6) // Adjust height as needed
//      ])
//      
//      // Add constraints for the "Select Date" button
//      selectDateButton.translatesAutoresizingMaskIntoConstraints = false
//      NSLayoutConstraint.activate([
//        selectDateButton.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 10),
//        selectDateButton.centerXAnchor.constraint(equalTo: alert.view.centerXAnchor),
//        selectDateButton.heightAnchor.constraint(equalToConstant: 50) // Adjust height as needed
//      ])
//      
//      // Present the alert controller
//      rootViewController.present(alert, animated: true, completion: nil)
//    }
//  }
//  
//  // Hold references to the callback and date picker
//  private var callback: RCTResponseSenderBlock?
//  private var datePicker: UIDatePicker?
//  private var parentViewController: UIViewController?
//}


//import Foundation
//import UIKit
//import React
//
//@objc(DatePickerIos)
//class DatePickerIos: NSObject {
//  
//  @objc
//  func showDatePicker(_ callback: @escaping RCTResponseSenderBlock) {
//    DispatchQueue.main.async {
//      guard let rootViewController = UIApplication.shared.windows.filter({ $0.isKeyWindow }).first?.rootViewController else {
//        return
//      }
//      
//      // Create the date picker
//      let datePicker = UIDatePicker()
//      datePicker.datePickerMode = .date
//      
//      if #available(iOS 14.0, *) {
//        datePicker.preferredDatePickerStyle = .inline
//      }
//
//      // Create the alert controller
//      let alert = UIAlertController(title: "Select Date", message: nil, preferredStyle: .actionSheet)
//      
//      // Add the date picker to the alert controller
//      alert.view.addSubview(datePicker)
//      
//      // Create "Select Date" button
//      let selectDateButton = UIButton(type: .system)
//      selectDateButton.setTitle("Select Date", for: .normal)
//      selectDateButton.setTitleColor(UIColor.systemBlue, for: .normal)
//      selectDateButton.backgroundColor = UIColor.white // Set background color to match the date picker
//      
//      // Set up button appearance
//      selectDateButton.layer.cornerRadius = 8
//      selectDateButton.layer.borderWidth = 1
//      selectDateButton.layer.borderColor = UIColor.systemBlue.cgColor
//      selectDateButton.contentEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20) // Adjust button padding
//      
//      // Add "Select Date" button to the alert controller
//      alert.view.addSubview(selectDateButton)
//
//      // Setup the button to call the appropriate callback when tapped
//      self.callback = callback
//      self.datePicker = datePicker
//      self.parentViewController = rootViewController
//
//      // Add constraints for the date picker within the alert controller's view
//      datePicker.translatesAutoresizingMaskIntoConstraints = false
//      NSLayoutConstraint.activate([
//        datePicker.topAnchor.constraint(equalTo: alert.view.topAnchor, constant: 20),
//        datePicker.leadingAnchor.constraint(equalTo: alert.view.leadingAnchor),
//        datePicker.trailingAnchor.constraint(equalTo: alert.view.trailingAnchor),
//        datePicker.bottomAnchor.constraint(equalTo: selectDateButton.topAnchor, constant: -20) // Ensure space for the button
//      ])
//      
//      // Add constraints for the "Select Date" button
//      selectDateButton.translatesAutoresizingMaskIntoConstraints = false
//      NSLayoutConstraint.activate([
//        selectDateButton.bottomAnchor.constraint(equalTo: alert.view.bottomAnchor, constant: -20),
//        selectDateButton.centerXAnchor.constraint(equalTo: alert.view.centerXAnchor)
//      ])
//      
//      // Present the alert controller
//      rootViewController.present(alert, animated: true, completion: nil)
//    }
//  }
//  
//  // Hold references to the callback and date picker
//  private var callback: RCTResponseSenderBlock?
//  private var datePicker: UIDatePicker?
//  private var parentViewController: UIViewController?
//}




//import Foundation
//import UIKit
//import React
//
//
//@objc(DatePickerIos)
//class DatePickerIos: NSObject {
//  
//  @objc
//  func showDatePicker(_ callback: @escaping RCTResponseSenderBlock) {
//    DispatchQueue.main.async {
//      guard let rootViewController = UIApplication.shared.windows.filter({ $0.isKeyWindow }).first?.rootViewController else {
//        return
//      }
//      
//      // Create the date picker
//      let datePicker = UIDatePicker()
//      datePicker.datePickerMode = .date
//      
//      if #available(iOS 14.0, *) {
//        datePicker.preferredDatePickerStyle = .inline
//      }
//
//      // Create the alert controller
//      let alert = UIAlertController(title: "Select Date", message: nil, preferredStyle: .actionSheet)
//      
//      // Add the date picker to the alert controller
//      alert.view.addSubview(datePicker)
//      
//      // Create "Select Date" button
//      let selectDateButton = UIButton(type: .system)
//      selectDateButton.setTitle("Select Date", for: .normal)
//      selectDateButton.setTitleColor(UIColor.systemBlue, for: .normal)
//      
//      // Set background color to match the date picker
//      selectDateButton.backgroundColor = datePicker.backgroundColor
//      
//      // Set up button appearance
//      selectDateButton.layer.cornerRadius = 8
////      selectDateButton.layer.borderWidth = 1
////      selectDateButton.layer.borderColor = UIColor.systemBlue.cgColor
//      
//      // Increase font size to match default button style
//      selectDateButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .regular)
//      
//      // Adjust button padding to increase size
//      selectDateButton.contentEdgeInsets = UIEdgeInsets(top: 12, left: 24, bottom: 12, right: 24)
//      
//      // Add "Select Date" button to the alert controller
//      alert.view.addSubview(selectDateButton)
//
//      // Setup the button to call the appropriate callback when tapped
//      self.callback = callback
//      self.datePicker = datePicker
//      self.parentViewController = rootViewController
//
//      // Add constraints for the date picker within the alert controller's view
//      datePicker.translatesAutoresizingMaskIntoConstraints = false
//      NSLayoutConstraint.activate([
//        datePicker.topAnchor.constraint(equalTo: alert.view.topAnchor, constant: 20),
//        datePicker.leadingAnchor.constraint(equalTo: alert.view.leadingAnchor),
//        datePicker.trailingAnchor.constraint(equalTo: alert.view.trailingAnchor),
//        datePicker.bottomAnchor.constraint(equalTo: selectDateButton.topAnchor, constant: -20) // Ensure space for the button
//      ])
//      
//      // Add constraints for the "Select Date" button
//      selectDateButton.translatesAutoresizingMaskIntoConstraints = false
//      NSLayoutConstraint.activate([
//        selectDateButton.bottomAnchor.constraint(equalTo: alert.view.bottomAnchor, constant: -20),
//        selectDateButton.centerXAnchor.constraint(equalTo: alert.view.centerXAnchor)
//      ])
//      
//      // Present the alert controller
//      rootViewController.present(alert, animated: true, completion: nil)
//    }
//  }
//  
//  // Hold references to the callback and date picker
//  private var callback: RCTResponseSenderBlock?
//  private var datePicker: UIDatePicker?
//  private var parentViewController: UIViewController?
//}



//import Foundation
//import UIKit
//import React
//
//@objc(DatePickerIos)
//class DatePickerIos: NSObject {
//  
//  @objc
//  func showDatePicker(_ callback: @escaping RCTResponseSenderBlock) {
//    DispatchQueue.main.async {
//      guard let rootViewController = UIApplication.shared.windows.filter({ $0.isKeyWindow }).first?.rootViewController else {
//        return
//      }
//      
//      // Create the date picker
//      let datePicker = UIDatePicker()
//      datePicker.datePickerMode = .date
//      
//      if #available(iOS 14.0, *) {
//        datePicker.preferredDatePickerStyle = .inline
//      }
//
//      // Create the alert controller
//      let alert = UIAlertController(title: "Select Date", message: nil, preferredStyle: .actionSheet)
//      
//      // Add the date picker to the alert controller
//      alert.view.addSubview(datePicker)
//      
//      // Create "Select Date" button
//      let selectDateButton = UIButton(type: .system)
//      selectDateButton.setTitle("Select Date", for: .normal)
//      selectDateButton.setTitleColor(UIColor.systemBlue, for: .normal)
//      
//      // Set background color to match the date picker
//      selectDateButton.backgroundColor = datePicker.backgroundColor
//      
//      // Set up button appearance
//      selectDateButton.layer.cornerRadius = 8
////      selectDateButton.layer.borderWidth = 1
////      selectDateButton.layer.borderColor = UIColor.systemBlue.cgColor
//      selectDateButton.titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
//      selectDateButton.contentEdgeInsets = UIEdgeInsets(top: 12, left: 24, bottom: 12, right: 24) // Adjust button padding
//      
//      // Add "Select Date" button to the alert controller
//      alert.view.addSubview(selectDateButton)
//
//      // Setup the button to call the appropriate callback when tapped
//      self.callback = callback
//      self.datePicker = datePicker
//      self.parentViewController = rootViewController
//
//      // Add constraints for the date picker within the alert controller's view
//      datePicker.translatesAutoresizingMaskIntoConstraints = false
//      NSLayoutConstraint.activate([
//        datePicker.topAnchor.constraint(equalTo: alert.view.topAnchor, constant: 20),
//        datePicker.leadingAnchor.constraint(equalTo: alert.view.leadingAnchor),
//        datePicker.trailingAnchor.constraint(equalTo: alert.view.trailingAnchor),
//        datePicker.bottomAnchor.constraint(equalTo: alert.view.bottomAnchor, constant: -60) // Adjust space between date picker and button
//      ])
//      
//      // Add constraints for the "Select Date" button
//      selectDateButton.translatesAutoresizingMaskIntoConstraints = false
//      NSLayoutConstraint.activate([
//        selectDateButton.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 10),
//        selectDateButton.centerXAnchor.constraint(equalTo: alert.view.centerXAnchor)
//      ])
//      
//      // Present the alert controller
//      rootViewController.present(alert, animated: true, completion: nil)
//    }
//  }
//  
//  // Hold references to the callback and date picker
//  private var callback: RCTResponseSenderBlock?
//  private var datePicker: UIDatePicker?
//  private var parentViewController: UIViewController?
//}



//import Foundation
//import UIKit
//import React
//
//
//@objc(DatePickerIos)
//class DatePickerIos: NSObject {
//  
//  @objc
//  func showDatePicker(_ callback: @escaping RCTResponseSenderBlock) {
//    DispatchQueue.main.async {
//      guard let rootViewController = UIApplication.shared.windows.filter({ $0.isKeyWindow }).first?.rootViewController else {
//        return
//      }
//      
//      // Create the date picker
//      let datePicker = UIDatePicker()
//      datePicker.datePickerMode = .date
//      
//      if #available(iOS 14.0, *) {
//        datePicker.preferredDatePickerStyle = .inline
//      }
//
//      // Create the alert controller
//      let alert = UIAlertController(title: "Select Date", message: nil, preferredStyle: .actionSheet)
//      
//      // Add the date picker to the alert controller
//      alert.view.addSubview(datePicker)
//      
//      // Create "Select Date" button
//      let selectDateButton = UIButton(type: .system)
//      selectDateButton.setTitle("Select Date", for: .normal)
//      selectDateButton.setTitleColor(UIColor.systemBlue, for: .normal)
//      selectDateButton.backgroundColor = datePicker.backgroundColor
//      selectDateButton.layer.cornerRadius = 8
//      selectDateButton.layer.borderWidth = 1
//      selectDateButton.layer.borderColor = UIColor.systemBlue.cgColor
//      selectDateButton.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
//      selectDateButton.contentEdgeInsets = UIEdgeInsets(top: 12, left: 24, bottom: 12, right: 24)
//      alert.view.addSubview(selectDateButton)
//
//      // Setup the button to call the appropriate callback when tapped
//      selectDateButton.addTarget(self, action: #selector(self.selectDateButtonTapped(_:)), for: .touchUpInside)
//      self.callback = callback
//      self.datePicker = datePicker
//      self.parentViewController = rootViewController
//
//      // Add constraints for the date picker within the alert controller's view
//      datePicker.translatesAutoresizingMaskIntoConstraints = false
//      NSLayoutConstraint.activate([
//        datePicker.topAnchor.constraint(equalTo: alert.view.topAnchor, constant: 20),
//        datePicker.leadingAnchor.constraint(equalTo: alert.view.leadingAnchor),
//        datePicker.trailingAnchor.constraint(equalTo: alert.view.trailingAnchor),
//        datePicker.bottomAnchor.constraint(equalTo: alert.view.bottomAnchor, constant: -60)
//      ])
//      
//      // Add constraints for the "Select Date" button
//      selectDateButton.translatesAutoresizingMaskIntoConstraints = false
//      NSLayoutConstraint.activate([
//        selectDateButton.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 10),
//        selectDateButton.centerXAnchor.constraint(equalTo: alert.view.centerXAnchor)
//      ])
//      
//      // Present the alert controller
//      rootViewController.present(alert, animated: true, completion: nil)
//    }
//  }
//  
//  // Hold references to the callback and date picker
//  private var callback: RCTResponseSenderBlock?
//  private var datePicker: UIDatePicker?
//  private var parentViewController: UIViewController?
//  
//  @objc private func selectDateButtonTapped(_ sender: UIButton) {
//    guard let datePicker = datePicker, let callback = callback else { return }
//    let dateFormatter = DateFormatter()
//    dateFormatter.dateFormat = "yyyy-MM-dd" // Adjust date format as needed
//    let date = dateFormatter.string(from: datePicker.date)
//    callback([date])
//    parentViewController?.dismiss(animated: true, completion: nil)
//  }
//}




import Foundation
import UIKit
import React

@objc(DatePickerIos)
class DatePickerIos: NSObject {
  
  @objc
  func showDatePicker(_ callback: @escaping RCTResponseSenderBlock) {
    DispatchQueue.main.async {
      guard let rootViewController = UIApplication.shared.windows.filter({ $0.isKeyWindow }).first?.rootViewController else {
        return
      }
      
      // Create the date picker
      let datePicker = UIDatePicker()
      datePicker.datePickerMode = .date
      
      if #available(iOS 14.0, *) {
        datePicker.preferredDatePickerStyle = .inline
      }

      // Create the alert controller
      let alert = UIAlertController(title: "Select Date", message: nil, preferredStyle: .actionSheet)
      
      // Add the date picker to the alert controller
      alert.view.addSubview(datePicker)
      
      // Create "Select Date" button
      let selectDateButton = UIButton(type: .system)
      selectDateButton.setTitle("Select Date", for: .normal)
      selectDateButton.setTitleColor(UIColor.systemBlue, for: .normal)
      selectDateButton.backgroundColor = datePicker.backgroundColor
      selectDateButton.layer.cornerRadius = 8
//      selectDateButton.layer.borderWidth = 1
//      selectDateButton.layer.borderColor = UIColor.systemBlue.cgColor
      selectDateButton.titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
      selectDateButton.contentEdgeInsets = UIEdgeInsets(top: 12, left: 24, bottom: 12, right: 24)
      alert.view.addSubview(selectDateButton)
      
      // Create "Cancel" button
      let cancelButton = UIButton(type: .system)
      cancelButton.setTitle("Cancel", for: .normal)
      cancelButton.setTitleColor(UIColor.systemRed, for: .normal)
      cancelButton.backgroundColor = datePicker.backgroundColor
      cancelButton.layer.cornerRadius = 8
//      cancelButton.layer.borderWidth = 1
//      cancelButton.layer.borderColor = UIColor.systemRed.cgColor
      cancelButton.titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
      cancelButton.contentEdgeInsets = UIEdgeInsets(top: 12, left: 24, bottom: 12, right: 24)
      alert.view.addSubview(cancelButton)

      // Setup the buttons to call the appropriate callback when tapped
      selectDateButton.addTarget(self, action: #selector(self.selectDateButtonTapped(_:)), for: .touchUpInside)
      cancelButton.addTarget(self, action: #selector(self.cancelButtonTapped(_:)), for: .touchUpInside)
      self.callback = callback
      self.datePicker = datePicker
      self.parentViewController = rootViewController

      // Add constraints for the date picker within the alert controller's view
      datePicker.translatesAutoresizingMaskIntoConstraints = false
      NSLayoutConstraint.activate([
        datePicker.topAnchor.constraint(equalTo: alert.view.topAnchor, constant: 20),
        datePicker.leadingAnchor.constraint(equalTo: alert.view.leadingAnchor),
        datePicker.trailingAnchor.constraint(equalTo: alert.view.trailingAnchor),
        datePicker.bottomAnchor.constraint(equalTo: alert.view.bottomAnchor, constant: -100)
      ])
      
      // Add constraints for the "Select Date" button
      selectDateButton.translatesAutoresizingMaskIntoConstraints = false
      NSLayoutConstraint.activate([
        selectDateButton.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 10),
        selectDateButton.centerXAnchor.constraint(equalTo: alert.view.centerXAnchor)
      ])
      
      // Add constraints for the "Cancel" button
      cancelButton.translatesAutoresizingMaskIntoConstraints = false
      NSLayoutConstraint.activate([
        cancelButton.topAnchor.constraint(equalTo: selectDateButton.bottomAnchor, constant: 10),
        cancelButton.centerXAnchor.constraint(equalTo: alert.view.centerXAnchor),
        cancelButton.bottomAnchor.constraint(equalTo: alert.view.bottomAnchor)
      ])
      
      // Present the alert controller
      rootViewController.present(alert, animated: true, completion: nil)
    }
  }
  
  // Hold references to the callback and date picker
  private var callback: RCTResponseSenderBlock?
  private var datePicker: UIDatePicker?
  private var parentViewController: UIViewController?
  
  @objc private func selectDateButtonTapped(_ sender: UIButton) {
    guard let datePicker = datePicker, let callback = callback else { return }
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd" // Adjust date format as needed
    let date = dateFormatter.string(from: datePicker.date)
    callback([date])
    parentViewController?.dismiss(animated: true, completion: nil)
  }
  
  @objc private func cancelButtonTapped(_ sender: UIButton) {
    parentViewController?.dismiss(animated: true, completion: nil)
  }
}


