//
//  Sections.swift
//  DataSource
//
//  Created by Bartosz Górka on 20/12/2022.
//

import Foundation

enum SpotifySectionType: Int {
    case recent
    case yourShows
    case recentlyPlayed
    case newEpisodes
}

struct SpotifyCollectionSection {
    let sectionType: SpotifySectionType
    let items: [SpotifyItemType]
}

extension SpotifyCollectionSection {
    static var sections: [SpotifyCollectionSection] {
        [
            SpotifyCollectionSection(
                sectionType: .recent,
                items: [
                    .recent(RecentCellModel(title: "Huberman Lab")),
                    .recent(RecentCellModel(title: "Liked songs")),
                    .recent(RecentCellModel(title: "Lifespan")),
                    .recent(RecentCellModel(title: "Metallica")),
                    .recent(RecentCellModel(title: "Christmas Hits")),
                    .recent(RecentCellModel(title: "Pure Tone")),
                ]
            ),
            SpotifyCollectionSection(
                sectionType: .yourShows,
                items: [
                    .show(ShowCellModel(title: "Huberman Lab", subtitle: "Show · Scicomm Media")),
                    .show(ShowCellModel(title: "Pure Tone", subtitle: "Show · Robertolozano")),
                    .show(ShowCellModel(title: "Lifespan with Dr. David Sinclair", subtitle: "Show · Scicomm Media")),
                    .show(ShowCellModel(title: "Lex Fridman Podcast", subtitle: "Show · Lex Fridman"))
                ]
            ),
            SpotifyCollectionSection(
                sectionType: .recentlyPlayed,
                items: [
                    .recentlyPlayed(RecentlyPlayedCellModel(title: "Beach Club Lounge House")),
                    .recentlyPlayed(RecentlyPlayedCellModel(title: "Liked Songs")),
                    .recentlyPlayed(RecentlyPlayedCellModel(title: "Christmas Hits")),
                    .recentlyPlayed(RecentlyPlayedCellModel(title: "Funk & Soul Classics")),
                    .recentlyPlayed(RecentlyPlayedCellModel(title: "Happy Mix")),
                    .recentlyPlayed(RecentlyPlayedCellModel(title: "Cozy Christmas Jazz")),
                    .recentlyPlayed(RecentlyPlayedCellModel(title: "Star Wars Soundtracks")),
                    .recentlyPlayed(RecentlyPlayedCellModel(title: "Huberman Lab")),
                    .recentlyPlayed(RecentlyPlayedCellModel(title: "Guerilla Radio Radio")),
                    .recentlyPlayed(RecentlyPlayedCellModel(title: "All Out 80s")),
                    .recentlyPlayed(RecentlyPlayedCellModel(title: "Pure Tone")),
                ]
            ),
            SpotifyCollectionSection(
                sectionType: .newEpisodes,
                items: [
                    .newEpisodes(EpisodeCellModel(title: "Dr. Kyle Gillett: Tools for Hormone Optimization in Males | Episode 102", subtitle: "My guest is Kyle Gillett, MD, a lorem ipsum dolor ...", info: "Dec 12 · 2 hrs 24 mins")),
                    .newEpisodes(EpisodeCellModel(title: "AMA #2: Improve Sleep, Reduce Sugar Cravings, Optimal Protein Intake, Stretching Frequency & More", subtitle: "My guest is Kyle Gillett, MD, a lorem ipsum dolor ...", info: "Dec 8 · 31 mins")),
                    .newEpisodes(EpisodeCellModel(title: "Using Caffeine to Optimize Mental & Physical Performance | Episode 101", subtitle: "In this epsode, I explain how to lorem ipsum dolor ...", info: "Dec 5 · 2 hrs 23 mins")),
                    .newEpisodes(EpisodeCellModel(title: "Dr. Kyle Gillett: Tools for Hormone Optimization in Males | Episode 102", subtitle: "My guest is Kyle Gillett, MD, a lorem ipsum dolor ...", info: "Dec 12 · 2 hrs 24 mins")),
                    .newEpisodes(EpisodeCellModel(title: "AMA #2: Improve Sleep, Reduce Sugar Cravings, Optimal Protein Intake, Stretching Frequency & More", subtitle: "My guest is Kyle Gillett, MD, a lorem ipsum dolor ...", info: "Dec 8 · 31 mins")),
                    .newEpisodes(EpisodeCellModel(title: "Using Caffeine to Optimize Mental & Physical Performance | Episode 101", subtitle: "In this epsode, I explain how to lorem ipsum dolor ...", info: "Dec 5 · 2 hrs 23 mins")),
                ]
            )
        ]
    }
}

