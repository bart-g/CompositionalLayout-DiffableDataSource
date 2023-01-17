//
//  SpotifyCollectionDataSource.swift
//  DataSource
//
//  Created by Bartosz Górka on 08/01/2023.
//

import UIKit

final class SpotifyCollectionDataSource {
    
    private weak var collectionView: UICollectionView!
    private lazy var dataSource = getDataSource()
    
    func use(collectionView: UICollectionView) {
        var snapshot = NSDiffableDataSourceSnapshot<SpotifySectionType, SpotifyItemType>()
        self.collectionView = collectionView
        self.collectionView?.dataSource = dataSource
        
        let sections = SpotifyCollectionSection.sections
        snapshot.appendSections(sections.map { $0.sectionType })
        sections.forEach { section in
            snapshot.appendItems(
                section.items,
                toSection: section.sectionType
            )
        }
        
        dataSource.apply(snapshot)
    }
}

private extension SpotifyCollectionDataSource {
    func getDataSource() -> UICollectionViewDiffableDataSource<SpotifySectionType, SpotifyItemType> {
        let dataSource = UICollectionViewDiffableDataSource<SpotifySectionType, SpotifyItemType>(
            collectionView: collectionView
        ) { collectionView, indexPath, item in
            switch item {
            case .recent(let model):
                let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: RecentCell.identifier,
                    for: indexPath
                ) as! RecentCell
                
                cell.label.text = model.title
                
                return cell
            case .show(let model):
                let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: ShowCell.identifier,
                    for: indexPath
                ) as! ShowCell
                
                cell.titleLabel.text = model.title
                cell.subtitleLabel.text = model.subtitle
                
                return cell
                
            case .recentlyPlayed(let model):
                let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: RecentlyPlayedCell.identifier,
                    for: indexPath
                ) as! RecentlyPlayedCell
                
                cell.titleLabel.text = model.title

                return cell
            case .newEpisodes(let model):
                let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: EpisodeCell.identifier,
                    for: indexPath
                ) as! EpisodeCell
                
                cell.titleLabel.text = model.title
                cell.subtitleLabel.text = model.subtitle
                
                return cell
            }
        }
        
        dataSource.supplementaryViewProvider = { collectinoView, kind, indexPath in            
            switch SpotifySupplementaryViewKind(rawValue: kind) {
            case .mainHeader:
                let mainHeader = collectinoView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: MainHeader.identifier,
                    for: indexPath
                ) as! MainHeader
                mainHeader.greetingLabel.text = "Good morning"
                
                return mainHeader
            case .headerWithButtons:
                let headerWithButtons = collectinoView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: HeaderWithButtons.identifier,
                    for: indexPath
                )
                
                return headerWithButtons
            case .header:
                let header = collectinoView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: Header.identifier,
                    for: indexPath
                ) as! Header
                                
                switch SpotifySectionType(rawValue: indexPath.section) {
                case .yourShows:
                    header.titleLabel.text = "Your shows"
                case .recentlyPlayed:
                    header.titleLabel.text = "Recently played"
                case .newEpisodes:
                    header.titleLabel.text = "New episodes"
                default:
                    fatalError("Not supported section")
                }
                
                return header
            default:
                return nil
            }
        }
        
        return dataSource
    }
}
