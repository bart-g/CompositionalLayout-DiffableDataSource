//
//  SpotifyCompositionalLayoutBuilder.swift
//  DataSource
//
//  Created by Bartosz Górka on 20/12/2022.
//

import UIKit

enum SpotifyCompositionalLayoutBuilder {
    static func build() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { section, _ in
            switch SpotifySectionType(rawValue: section) {
            case .recent:
                return self.getRecentLayout()
            case .yourShows:
                return self.getYourShowsLayout()
            case .recentlyPlayed:
                return self.getRecentlyPlayedLayout()
            case .newEpisodes:
                return self.getNewEpisodesLayout()
            case .none:
                fatalError()
            }
        }
        
        let mainHeaderSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(40)
        )
        let mainHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: mainHeaderSize,
            elementKind: SpotifySupplementaryViewKind.mainHeader.rawValue,
            alignment: .top
        )
        mainHeader.contentInsets = .init(
            top: 0,
            leading: 10,
            bottom: 0,
            trailing: 10
        )
        
        let buttonsHeaderSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(50)
        )
        let buttonsHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: buttonsHeaderSize,
            elementKind: SpotifySupplementaryViewKind.headerWithButtons.rawValue,
            alignment: .top,
            absoluteOffset: CGPoint(
                x: 0,
                y: 50
            )
        )
        buttonsHeader.pinToVisibleBounds = true
        buttonsHeader.zIndex = .max
        
        let configuration = UICollectionViewCompositionalLayoutConfiguration()
        configuration.boundarySupplementaryItems = [
            mainHeader,
            buttonsHeader
        ]
        
        layout.configuration = configuration
        
        return layout
    }
}

private extension SpotifyCompositionalLayoutBuilder {
    static func getRecentLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.5),
            heightDimension: .absolute(50)
        )
        let item = NSCollectionLayoutItem(
            layoutSize: itemSize
        )
        item.contentInsets = .init(
            top: 0,
            leading: 5,
            bottom: 0,
            trailing: 5
        )
      
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(50)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
      
        let section = NSCollectionLayoutSection(
            group: group
        )
        section.interGroupSpacing = 10
        section.contentInsets = .init(
            top: 60,
            leading: 10,
            bottom: 16,
            trailing: 10
        )
    
        return section
    }
     
    static func getYourShowsLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(210)
        )
        let item = NSCollectionLayoutItem(
            layoutSize: itemSize
        )
      
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.42),
            heightDimension: .absolute(210)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
      
        let section = NSCollectionLayoutSection(
            group: group
        )
        section.contentInsets = .init(
            top: 10,
            leading: 10,
            bottom: 16,
            trailing: 10
        )
        
        let headerItem = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .absolute(50)
            ),
            elementKind: SpotifySupplementaryViewKind.header.rawValue,
            alignment: .top
        )
        headerItem.zIndex = 0
        section.boundarySupplementaryItems = [headerItem]
        section.orthogonalScrollingBehavior = .continuous
        section.interGroupSpacing = 16
        
        return section
    }
    
    static func getRecentlyPlayedLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(140)
        )
        let item = NSCollectionLayoutItem(
            layoutSize: itemSize
        )
      
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.25),
            heightDimension: .absolute(140)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
      
        let section = NSCollectionLayoutSection(
            group: group
        )
        section.contentInsets = .init(
            top: 10,
            leading: 10,
            bottom: 16,
            trailing: 10
        )
        
        let headerItem = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .absolute(50)
            ),
            elementKind: SpotifySupplementaryViewKind.header.rawValue,
            alignment: .top
        )
        headerItem.zIndex = 0
        section.boundarySupplementaryItems = [headerItem]
        section.orthogonalScrollingBehavior = .continuous
        section.interGroupSpacing = 16
        
        return section
    }
    
    static func getNewEpisodesLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(120)
        )
        let item = NSCollectionLayoutItem(
            layoutSize: itemSize
        )
        item.contentInsets = .init(
            top: 0,
            leading: 0,
            bottom: 16,
            trailing: 0
        )
      
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.75),
            heightDimension: .absolute(240)
        )
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: groupSize,
            repeatingSubitem: item,
            count: 2
        )
        let section = NSCollectionLayoutSection(
            group: group
        )
        section.interGroupSpacing = 20
        section.contentInsets = .init(
            top: 10,
            leading: 10,
            bottom: 16,
            trailing: 10
        )
        
        let headerItem = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .absolute(50)
            ),
            elementKind: SpotifySupplementaryViewKind.header.rawValue,
            alignment: .top
        )
        headerItem.zIndex = 0
        section.boundarySupplementaryItems = [headerItem]
        section.orthogonalScrollingBehavior = .continuous
        
        return section
    }
}
