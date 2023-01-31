//
//  SpotifyCompositionalLayoutBuilder.swift
//  DataSource
//
//  Created by Bartosz Górka on 20/12/2022.
//

import UIKit

enum SpotifyCompositionalLayoutBuilder {
    private enum Constants {
        static let headerHeight: CGFloat = 50
        static let horizontalMargin: CGFloat = 10
        static let recentItemHeight: CGFloat = 140
        static let newEpisodesItemHeight: CGFloat = 120
        static let yourShowsHeight: CGFloat = 210
    }
    
    static func build(for sections: [SpotifySectionType]) -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { section, _ in
            switch sections[section] {
            case .recent:
                return self.getRecentLayout()
            case .yourShows:
                return self.getYourShowsLayout()
            case .recentlyPlayed:
                return self.getRecentlyPlayedLayout()
            case .newEpisodes:
                return self.getNewEpisodesLayout()
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
            leading: Constants.horizontalMargin,
            bottom: 0,
            trailing: Constants.horizontalMargin
        )
        
        let buttonsHeaderSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(Constants.headerHeight)
        )
        let buttonsHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: buttonsHeaderSize,
            elementKind: SpotifySupplementaryViewKind.headerWithButtons.rawValue,
            alignment: .top,
            absoluteOffset: CGPoint(
                x: 0,
                y: Constants.headerHeight
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
        let itemHeight: CGFloat = 50
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.5),
            heightDimension: .absolute(itemHeight)
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
            heightDimension: .absolute(itemHeight)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
      
        let section = NSCollectionLayoutSection(
            group: group
        )
        section.interGroupSpacing = 10
        section.contentInsets = sectionInsets(top: itemHeight + 10)
    
        return section
    }
     
    static func getYourShowsLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(Constants.yourShowsHeight)
        )
        let item = NSCollectionLayoutItem(
            layoutSize: itemSize
        )
      
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.42),
            heightDimension: .absolute(Constants.yourShowsHeight)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
      
        let section = NSCollectionLayoutSection(
            group: group
        )
        section.contentInsets = sectionInsets()
        section.boundarySupplementaryItems = [headerItem]
        section.orthogonalScrollingBehavior = .continuous
        section.interGroupSpacing = 16
        
        return section
    }
    
    static func getRecentlyPlayedLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(Constants.recentItemHeight)
        )
        let item = NSCollectionLayoutItem(
            layoutSize: itemSize
        )
      
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.25),
            heightDimension: .absolute(Constants.recentItemHeight)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
      
        let section = NSCollectionLayoutSection(
            group: group
        )
        section.contentInsets = sectionInsets()
        section.boundarySupplementaryItems = [headerItem]
        section.orthogonalScrollingBehavior = .continuous
        section.interGroupSpacing = 16
        
        return section
    }
    
    static func getNewEpisodesLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(Constants.newEpisodesItemHeight)
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
            heightDimension: .absolute(Constants.newEpisodesItemHeight * 2)
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
        section.contentInsets = sectionInsets()
        section.boundarySupplementaryItems = [headerItem]
        section.orthogonalScrollingBehavior = .continuous
        
        return section
    }
}

private extension SpotifyCompositionalLayoutBuilder {
    static var headerItem: NSCollectionLayoutBoundarySupplementaryItem {
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .absolute(Constants.headerHeight)
            ),
            elementKind: SpotifySupplementaryViewKind.header.rawValue,
            alignment: .top
        )
        header.zIndex = 0
        
        return header
    }
        
    
    static func sectionInsets(
        top: CGFloat = 10,
        leading: CGFloat = Constants.horizontalMargin,
        bottom: CGFloat = 16,
        trailing: CGFloat = Constants.horizontalMargin
    ) -> NSDirectionalEdgeInsets {
        .init(
            top: top,
            leading: leading,
            bottom: bottom,
            trailing: trailing
        )
    }
}
