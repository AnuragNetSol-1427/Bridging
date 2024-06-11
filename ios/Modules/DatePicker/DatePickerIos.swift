//
//  DatePickerIos.swift
//  Bridging
//
//  Created by Anurag on 10/06/24.
//

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
      
      let datePicker = UIDatePicker()
      datePicker.datePickerMode = .date
      
      if #available(iOS 14.0, *) {
        datePicker.preferredDatePickerStyle = .inline
      }

      let alert = UIAlertController(title: "Select Date", message: nil, preferredStyle: .actionSheet)
      
      alert.view.addSubview(datePicker)
      
      let selectDateButton = UIButton(type: .system)
      selectDateButton.setTitle("Select Date", for: .normal)
      selectDateButton.setTitleColor(UIColor.systemBlue, for: .normal)
      selectDateButton.backgroundColor = datePicker.backgroundColor
      selectDateButton.layer.cornerRadius = 8
      // selectDateButton.layer.borderWidth = 1
      // selectDateButton.layer.borderColor = UIColor.systemBlue.cgColor
      selectDateButton.titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
      selectDateButton.contentEdgeInsets = UIEdgeInsets(top: 12, left: 24, bottom: 12, right: 24)
      alert.view.addSubview(selectDateButton)

      let cancelButton = UIButton(type: .system)
      cancelButton.setTitle("Cancel", for: .normal)
      cancelButton.setTitleColor(UIColor.systemRed, for: .normal)
      cancelButton.backgroundColor = datePicker.backgroundColor
      cancelButton.layer.cornerRadius = 8
      // cancelButton.layer.borderWidth = 1
      // cancelButton.layer.borderColor = UIColor.systemRed.cgColor
      cancelButton.titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
      cancelButton.contentEdgeInsets = UIEdgeInsets(top: 12, left: 24, bottom: 12, right: 24)
      alert.view.addSubview(cancelButton)

      selectDateButton.addTarget(self, action: #selector(self.selectDateButtonTapped(_:)), for: .touchUpInside)
      cancelButton.addTarget(self, action: #selector(self.cancelButtonTapped(_:)), for: .touchUpInside)
      self.callback = callback
      self.datePicker = datePicker
      self.parentViewController = rootViewController

      datePicker.translatesAutoresizingMaskIntoConstraints = false
      NSLayoutConstraint.activate([
        datePicker.topAnchor.constraint(equalTo: alert.view.topAnchor, constant: 20),
        datePicker.leadingAnchor.constraint(equalTo: alert.view.leadingAnchor),
        datePicker.trailingAnchor.constraint(equalTo: alert.view.trailingAnchor),
        datePicker.bottomAnchor.constraint(equalTo: alert.view.bottomAnchor, constant: -100)
      ])
      
      selectDateButton.translatesAutoresizingMaskIntoConstraints = false
      NSLayoutConstraint.activate([
        selectDateButton.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 10),
        selectDateButton.centerXAnchor.constraint(equalTo: alert.view.centerXAnchor)
      ])
      
      cancelButton.translatesAutoresizingMaskIntoConstraints = false
      NSLayoutConstraint.activate([
        cancelButton.topAnchor.constraint(equalTo: selectDateButton.bottomAnchor, constant: 10),
        cancelButton.centerXAnchor.constraint(equalTo: alert.view.centerXAnchor),
        cancelButton.bottomAnchor.constraint(equalTo: alert.view.bottomAnchor)
      ])
      
      rootViewController.present(alert, animated: true, completion: nil)
    }
  }
  
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
