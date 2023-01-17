//
//  SpotifyViewController.swift
//  DataSource
//
//  Created by Bartosz Górka on 08/12/2022.
//

import UIKit

final class SpotifyViewController: UIViewController {
    
    private let collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewLayout()
    )
    private let dataSource = SpotifyCollectionDataSource()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupCollectionView()
        dataSource.use(collectionView: collectionView)
    }
}


private extension SpotifyViewController {
    func setupCollectionView() {
        view.backgroundColor = .black
        collectionView.backgroundColor = .clear
        
        view.addSubview(collectionView)
        
        registerCells()
        registerSupplementaryViews()
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor
            ),
            collectionView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor
            ),
            collectionView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor
            ),
            collectionView.bottomAnchor.constraint(
                equalTo: view.bottomAnchor
            ),
        ])
        
        collectionView.collectionViewLayout = SpotifyCompositionalLayoutBuilder.build()
    }
    
    func registerCells() {
        let cells = [
            RecentCell.self,
            ShowCell.self,
            RecentlyPlayedCell.self,
            EpisodeCell.self,
        ]
        
        cells.forEach {
            collectionView.register(
                $0.self,
                forCellWithReuseIdentifier: $0.identifier
            )
        }
    }
    
    func registerSupplementaryViews() {
        let headers: [(UICollectionReusableView.Type, String)] = [
            (MainHeader.self, SpotifySupplementaryViewKind.mainHeader.rawValue),
            (HeaderWithButtons.self, SpotifySupplementaryViewKind.headerWithButtons.rawValue),
            (Header.self, SpotifySupplementaryViewKind.header.rawValue)
        ]
        
        headers.forEach { header, kind in
            collectionView.register(
                header.self,
                forSupplementaryViewOfKind: kind,
                withReuseIdentifier: header.identifier
            )
        }
    }
}

