//
//  UICollectionReusableView.swift
//  CompositionalImageViewer
//
//  Created by Ramazan Karami on 2/22/23.
//

import UIKit

extension UICollectionReusableView {

    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
}
