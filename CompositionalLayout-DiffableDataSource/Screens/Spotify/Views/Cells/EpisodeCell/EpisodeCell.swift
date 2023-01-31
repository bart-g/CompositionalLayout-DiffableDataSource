//
//  EpisodeCell.swift
//  DataSource
//
//  Created by Bartosz Górka on 20/12/2022.
//

import UIKit

final class EpisodeCell: UICollectionViewCell {
    
    private let horizontalStackView = UIStackView()
    private let verticalStackView = UIStackView()
    private let actionsStackView = UIStackView()

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
    
    func configure(with model: EpisodeCellModel) {
        titleLabel.text = model.title
        subtitleLabel.text = model.subtitle
    }
}

private extension EpisodeCell {
    func setup() {
        contentView.addSubview(horizontalStackView)
        
        horizontalStackView.axis = .horizontal
        horizontalStackView.pinToSuperView()
        horizontalStackView.spacing = 16
        
        [
            imageView,
            verticalStackView
        ].forEach(horizontalStackView.addArrangedSubview)
        
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 2
        
        [
            titleLabel,
            subtitleLabel,
            UIView(),
            actionsStackView
        ].forEach(verticalStackView.addArrangedSubview)
        
        imageView.backgroundColor = .lightGray
        imageView.layer.cornerRadius = 4
        imageView.layer.masksToBounds = true
        
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        titleLabel.numberOfLines = 0
        
        subtitleLabel.textColor = .lightGray
        subtitleLabel.font = UIFont.systemFont(ofSize: 12)
        subtitleLabel.numberOfLines = 0
        
        actionsStackView.axis = .horizontal
        actionsStackView.spacing = 8
        
        let addButton = UIButton()
        addButton.setImage(UIImage(named: "plus"), for: [])
        addButton.tintColor = .lightGray
        addButton.layer.cornerRadius = 10
        addButton.layer.borderWidth = 1
        addButton.layer.borderColor = UIColor.lightGray.cgColor

        let playButton = UIButton()
        playButton.setImage(UIImage(named: "play-button"), for: [])
        playButton.tintColor = .white
//        playButton.setTitleColor(.black, for: [])
//        playButton.layer.cornerRadius = 10
//        playButton.layer.masksToBounds = true
//        playButton.backgroundColor = .white

        let infoLabel = UILabel()
        infoLabel.textColor = .lightGray
        infoLabel.font = UIFont.systemFont(ofSize: 10)
        infoLabel.numberOfLines = 1
        
        [
            addButton,
            infoLabel,
            UIView(),
            playButton
        ].forEach {
            actionsStackView.addArrangedSubview($0)
        }
        
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
            playButton.heightAnchor.constraint(equalTo: playButton.widthAnchor),
            addButton.heightAnchor.constraint(equalTo: addButton.widthAnchor),
            actionsStackView.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
