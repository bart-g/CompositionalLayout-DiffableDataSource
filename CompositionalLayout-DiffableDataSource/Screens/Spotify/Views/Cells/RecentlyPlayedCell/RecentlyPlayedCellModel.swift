//
//  RecentlyPlayedCellModel.swift
//  DataSource
//
//  Created by Bartosz Górka on 16/01/2023.
//

import UIKit

struct RecentlyPlayedCellModel: Hashable, Equatable {
    let id = UUID()
    let image = UIImage()
    let title: String
}
