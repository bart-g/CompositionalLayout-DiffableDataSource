//
//  SnapshotBuilder.swift
//  CompositionalLayout-DiffableDataSource
//
//  Created by Bartosz Górka on 31/01/2023.
//

import UIKit

struct SnapshotBuilder {
    func build(from sections: [SpotifyCollectionSection]) -> Snapshot {
        var snapshot = NSDiffableDataSourceSnapshot<SpotifySectionType, SpotifyItemType>()
        
        let sections = SpotifyCollectionSection.sections
        snapshot.appendSections(sections.map { $0.sectionType })
        sections.forEach { section in
            snapshot.appendItems(
                section.items,
                toSection: section.sectionType
            )
        }

        return snapshot
    }
}
