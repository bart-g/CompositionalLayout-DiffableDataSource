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
        
        let musicButton = UIButton()
        musicButton.setTitle("Music", for: [])
        
        let podcastsAndShowsButton = UIButton()
        podcastsAndShowsButton.setTitle("Podcasts & Shows", for: [])
        
        [
            musicButton,
            podcastsAndShowsButton
        ].forEach {
            $0.backgroundColor = .gray
            $0.titleLabel?.textColor = .white
            $0.titleLabel?.font = UIFont.systemFont(ofSize: 10)
            
            let containerView = UIView()
            containerView.layer.masksToBounds = true
            containerView.layer.cornerRadius = 15
            containerView.backgroundColor = .gray
            
            containerView.addSubview($0)
            $0.pinToSuperView(
                insets: UIEdgeInsets(
                    top: 8,
                    left: 10,
                    bottom: -8,
                    right: -10
                )
            )

            stackView.addArrangedSubview(containerView)
        }
        
        stackView.addSubview(UIView())
    }
}
