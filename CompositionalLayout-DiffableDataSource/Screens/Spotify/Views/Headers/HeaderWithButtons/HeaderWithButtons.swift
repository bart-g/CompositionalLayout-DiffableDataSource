//
//  Footer.swift
//  DataSource
//
//  Created by Bartosz Górka on 20/12/2022.
//

import UIKit

final class HeaderWithButtons: UICollectionReusableView {
    
    private let stackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: HeaderWithButtonsModel) {
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }

        model.buttonTitles.forEach {
            let buttonContainerView = getButtonContainerView(with: $0)
            stackView.addArrangedSubview(buttonContainerView
)
        }
        
        stackView.addSubview(UIView())
    }
}

private extension HeaderWithButtons {
    func setup() {
        backgroundColor = .black
        addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 10
            ),
            stackView.topAnchor.constraint(
                equalTo: topAnchor,
                constant: 10
            ),
            stackView.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: -10
            )
        ])
    }
    
    func getButtonContainerView(with title: String) -> UIView {
        let button = UIButton()
        button.setTitle(title, for: [])
        
        button.backgroundColor = .gray
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        
        let containerView = UIView()
        containerView.layer.masksToBounds = true
        containerView.layer.cornerRadius = 15
        containerView.backgroundColor = .gray
        
        containerView.addSubview(button)
        button.pinToSuperView(
            insets: UIEdgeInsets(
                top: 8,
                left: 10,
                bottom: -8,
                right: -10
            )
        )
        
        return containerView
    }
}
