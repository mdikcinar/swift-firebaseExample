//
//  ToastExtension.swift
//  SwiftFirebaseExample
//
//  Created by Mustafa Ali DİKÇINAR on 18.08.2022.
//
import UIKit

extension UIViewController {

func showToast(message : String, font: UIFont? = nil) {

    let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 125, y: self.view.frame.size.height-100, width: 250, height: 35))
    toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.8)
    toastLabel.textColor = UIColor.white
    toastLabel.font = font ?? .systemFont(ofSize: 12.0)
    toastLabel.textAlignment = .center;
    toastLabel.text = message
    toastLabel.alpha = 1.0
    toastLabel.layer.cornerRadius = 10;
    toastLabel.clipsToBounds  =  true
    self.view.addSubview(toastLabel)
    UIView.animate(withDuration: 0.8, delay: 2, options: .curveEaseInOut, animations: {
         toastLabel.alpha = 0.0
    }, completion: {(isCompleted) in
        toastLabel.removeFromSuperview()
    })
} }
