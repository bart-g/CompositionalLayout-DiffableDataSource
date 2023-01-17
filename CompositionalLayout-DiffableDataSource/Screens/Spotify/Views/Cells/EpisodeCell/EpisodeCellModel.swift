//
//  EpisodeCellModel.swift
//  DataSource
//
//  Created by Bartosz Górka on 16/01/2023.
//

import UIKit

struct EpisodeCellModel: Hashable, Equatable {
    let id = UUID()
    let image = UIImage()
    let title: String
    let subtitle: String
    let info: String
}
