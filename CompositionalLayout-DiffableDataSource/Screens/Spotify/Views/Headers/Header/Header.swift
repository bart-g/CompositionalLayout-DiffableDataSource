//
//  Header.swift
//  DataSource
//
//  Created by Bartosz Górka on 20/12/2022.
//

import UIKit

final class Header: UICollectionReusableView {
    
    let titleLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: HeaderModel) {
        titleLabel.text = model.title
    }
}

private extension Header {
    func setup() {
        addSubview(titleLabel)
        titleLabel.pinToSuperView()
        
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(
            ofSize: 22,
            weight: .bold
        )
    }
}
