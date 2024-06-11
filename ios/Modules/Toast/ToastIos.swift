//
//  ToastIos.swift
//  Bridging
//
//  Created by Anurag on 11/06/24.
//

import Foundation
import UIKit
import React

extension UIViewController {
    func toast(message: String, seconds: Double = 3.0) {
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width / 2 - 75, y: self.view.frame.size.height - 100, width: 150, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10
        toastLabel.clipsToBounds = true
        self.view.addSubview(toastLabel)
      UIView.animate(withDuration: seconds, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: { _ in
            toastLabel.removeFromSuperview()
        })
    }
}

@objc(ToastIos) class ToastIos: NSObject {
    @objc static func requireMainQueueSetup() -> Bool {
        return true
    }
    
    func getTopViewController() -> UIViewController? {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let keyWindow = windowScene.windows.first(where: { $0.isKeyWindow }),
           let topController = keyWindow.rootViewController {
            var top = topController
            while let presentedViewController = top.presentedViewController {
                top = presentedViewController
            }
            return top
        }
        return nil
    }

    func displayToast(message: String, seconds: Double) {
        DispatchQueue.main.async {
            if let topController = self.getTopViewController() {
                topController.toast(message: message, seconds: seconds)
            }
        }
    }

    @objc public func openToast(_ param: String) {
        print(param)
        displayToast(message: param, seconds: 5)
    }
}
