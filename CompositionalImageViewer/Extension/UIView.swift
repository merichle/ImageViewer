//
//  UIView.swift
//  CompositionalImageViewer
//
//  Created by Ramazan Karami on 2/22/23.
//

import UIKit

extension UIView {

    @discardableResult
    func animating() -> UIActivityIndicatorView {
        lazy var activityIndicatorView: UIActivityIndicatorView  = {
            let activityIndicatorView = UIActivityIndicatorView()
            activityIndicatorView.hidesWhenStopped = true
            activityIndicatorView.startAnimating()
            activityIndicatorView.tintColor = UIColor.darkText
            return activityIndicatorView
        }()
        addSubview(activityIndicatorView)
        activityIndicatorView.pin(to: self)
        return activityIndicatorView
    }

    func pin(to superView: UIView){
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
    }
}

