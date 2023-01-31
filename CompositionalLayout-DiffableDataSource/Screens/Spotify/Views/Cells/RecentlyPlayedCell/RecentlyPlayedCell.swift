//
//  ShowCollectionViewCell.swift
//  DataSource
//
//  Created by Bartosz Górka on 20/12/2022.
//

import UIKit

final class RecentlyPlayedCell: UICollectionViewCell {
    
    private let stackView = UIStackView()
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: RecentlyPlayedCellModel) {
        titleLabel.text = model.title
    }
}

private extension RecentlyPlayedCell {
    func setup() {
        contentView.addSubview(stackView)
        
        stackView.axis = .vertical
        stackView.pinToSuperView()
        stackView.spacing = 2
        
        imageView.backgroundColor = .lightGray
        
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        titleLabel.numberOfLines = 2
      
        [
            imageView,
            titleLabel,
            UIView()
        ].forEach(stackView.addArrangedSubview)
        
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor)
        ])
    }
}
