//
//  SpotifyCollectionDataSource.swift
//  DataSource
//
//  Created by Bartosz Górka on 08/01/2023.
//

import UIKit

typealias Snapshot = NSDiffableDataSourceSnapshot<SpotifySectionType, SpotifyItemType>

final class SpotifyCollectionDataSource {
    
    private weak var collectionView: UICollectionView!
    private(set) lazy var dataSource = getDataSource()
    
    func use(collectionView: UICollectionView) {
        self.collectionView = collectionView
        self.collectionView?.dataSource = dataSource
    }
    
    func update(with snapshot: Snapshot) {
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
                
                cell.configure(with: model)
                
                return cell
            case .show(let model):
                let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: ShowCell.identifier,
                    for: indexPath
                ) as! ShowCell
                
                cell.configure(with: model)
                
                return cell
                
            case .recentlyPlayed(let model):
                let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: RecentlyPlayedCell.identifier,
                    for: indexPath
                ) as! RecentlyPlayedCell

                cell.configure(with: model)

                return cell
            case .newEpisodes(let model):
                let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: EpisodeCell.identifier,
                    for: indexPath
                ) as! EpisodeCell
                
                cell.configure(with: model)
                
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
                
                let section = dataSource.snapshot().sectionIdentifiers[indexPath.section]
                                
                switch section {
                case .yourShows(let headerViewModel),
                     .recentlyPlayed(let headerViewModel),
                     .newEpisodes(let headerViewModel):
                    header.titleLabel.text = headerViewModel.title
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
