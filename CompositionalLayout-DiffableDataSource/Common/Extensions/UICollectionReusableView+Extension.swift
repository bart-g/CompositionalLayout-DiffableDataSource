//
//  UICollectionReusableView+Extension.swift
//  DataSource
//
//  Created by Bartosz Górka on 16/01/2023.
//

import class UIKit.UICollectionReusableView

extension UICollectionReusableView {
    static var identifier: String {
        String(describing: Self.self)
    }
}
