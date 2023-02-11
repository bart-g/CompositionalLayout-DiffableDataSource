//
//  HeaderCell.swift
//  DataSource
//
//  Created by Bartosz Górka on 20/12/2022.
//

import UIKit

final class MainHeader: UICollectionReusableView {
    
    private let buttonsStackView = UIStackView()
    private let greetingLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: MainHeaderModel) {
        greetingLabel.text = model.greeting
        
        buttonsStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        model.buttons.forEach {
            let button = getButton(with: $0.image)
            buttonsStackView.addArrangedSubview(button)
        }
    }
}

private extension MainHeader {
    func setup() {
        backgroundColor = .clear
        buttonsStackView.spacing = 20
        buttonsStackView.distribution = .fill

        greetingLabel.textColor = .white
        greetingLabel.font = UIFont.systemFont(
            ofSize: 20,
            weight: .bold
        )
        
        greetingLabel.translatesAutoresizingMaskIntoConstraints = false
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        [
            greetingLabel,
            buttonsStackView
        ].forEach(addSubview)
        
        NSLayoutConstraint.activate([
            greetingLabel.leadingAnchor.constraint(
                equalTo: leadingAnchor
            ),
            greetingLabel.trailingAnchor.constraint(
                greaterThanOrEqualTo: buttonsStackView.leadingAnchor,
                constant: 12
            ),
            greetingLabel.topAnchor.constraint(
                equalTo: topAnchor
            ),
            greetingLabel.bottomAnchor.constraint(
                equalTo: bottomAnchor
            ),
            buttonsStackView.centerYAnchor.constraint(
                equalTo: greetingLabel.centerYAnchor
            ),
            buttonsStackView.trailingAnchor.constraint(
                equalTo: trailingAnchor
            ),
        ])
    }
    
    func getButton(with image: UIImage) -> UIButton {
        let button = UIButton()
        button.setImage(image, for: [])
        button.imageView?.tintColor = .white
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: 20),
            button.widthAnchor.constraint(equalToConstant: 20)
        ])
        button.backgroundColor = .black
        button.titleLabel?.font = UIFont.systemFont(
            ofSize: 12,
            weight: .semibold
        )
        
        return button
    }
}
