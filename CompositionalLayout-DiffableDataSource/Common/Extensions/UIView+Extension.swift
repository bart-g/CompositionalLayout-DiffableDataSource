//
//  UIView+Extension.swift
//  DataSource
//
//  Created by Bartosz Górka on 16/01/2023.
//

import UIKit

extension UIView {
    func pinToSuperView(insets: UIEdgeInsets = .zero) {
        guard let superview else { fatalError() }
        
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(
                equalTo: superview.leadingAnchor,
                constant: insets.left
            ),
            trailingAnchor.constraint(
                equalTo: superview.trailingAnchor,
                constant: insets.right
            ),
            topAnchor.constraint(
                equalTo: superview.topAnchor,
                constant: insets.top
            ),
            bottomAnchor.constraint(
                equalTo: superview.bottomAnchor,
                constant: insets.bottom
            ),
        ])
    }
}
