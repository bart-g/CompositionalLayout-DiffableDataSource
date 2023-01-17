//
//  HeaderCell.swift
//  DataSource
//
//  Created by Bartosz Górka on 20/12/2022.
//

import UIKit

final class MainHeader: UICollectionReusableView {
    
    private let buttonsStackView = UIStackView()
    let greetingLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension MainHeader {
    func setup() {
        backgroundColor = .clear
        buttonsStackView.spacing = 20
        buttonsStackView.distribution = .fill
        let notificationsButton = UIButton()
        notificationsButton.setImage(UIImage(named: "bell"), for: [])
        notificationsButton.imageView?.tintColor = .white
        let timeButton = UIButton()
        timeButton.setImage(UIImage(named: "wall-clock"), for: [])
        let settingsButton = UIButton()
        settingsButton.setImage(UIImage(named: "settings"), for: [])
        
        [
            notificationsButton,
            timeButton,
            settingsButton,
        ].forEach {
            buttonsStackView.addArrangedSubview($0)
            NSLayoutConstraint.activate([
                $0.heightAnchor.constraint(equalToConstant: 20),
                $0.widthAnchor.constraint(equalToConstant: 20)
            ])
            $0.imageView?.tintColor = .white
            $0.backgroundColor = .black
            $0.titleLabel?.font = UIFont.systemFont(
                ofSize: 12,
                weight: .semibold
            )
        }
        
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
}
