//
//  Sections.swift
//  DataSource
//
//  Created by Bartosz Górka on 20/12/2022.
//

import Foundation

enum SpotifySectionType: Hashable {
    case recent(MainHeaderModel, HeaderWithButtonsModel)
    case yourShows(HeaderModel)
    case recentlyPlayed(HeaderModel)
    case newEpisodes(HeaderModel)
}
