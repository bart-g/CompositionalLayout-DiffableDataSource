//
//  SpotifyItemType.swift
//  DataSource
//
//  Created by Bartosz Górka on 20/12/2022.
//

import Foundation

enum SpotifyItemType: Equatable, Hashable {
    case recent(RecentCellModel)
    case show(ShowCellModel)
    case recentlyPlayed(RecentlyPlayedCellModel)
    case newEpisodes(EpisodeCellModel)
}
