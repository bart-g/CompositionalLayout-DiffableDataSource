//
//  RecentCell.swift
//  DataSource
//
//  Created by Bartosz Górka on 20/12/2022.
//

import UIKit

final class RecentCell: UICollectionViewCell {
    
    private let imageView = UIImageView()
    private let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: RecentCellModel) {
        label.text = model.title
        imageView.image = model.image
    }
}

private extension RecentCell {
    func setup() {
        contentView.backgroundColor = .darkGray
        contentView.layer.masksToBounds = true
        contentView.layer.cornerRadius = 4
        
        imageView.backgroundColor = .lightGray
        imageView.tintColor = .white
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        [
            imageView,
            label
        ].forEach(contentView.addSubview)
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor
            ),
            imageView.trailingAnchor.constraint(
                equalTo: label.leadingAnchor,
                constant: -8
            ),
            imageView.topAnchor.constraint(
                equalTo: contentView.topAnchor
            ),
            imageView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor
            ),
            imageView.widthAnchor.constraint(
                equalToConstant: 50
            ),
            label.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor
            ),
            label.centerYAnchor.constraint(
                equalTo: imageView.centerYAnchor
            )
        ])
    }
}
