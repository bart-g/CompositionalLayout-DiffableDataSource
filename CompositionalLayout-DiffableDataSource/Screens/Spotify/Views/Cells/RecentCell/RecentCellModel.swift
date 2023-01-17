//
//  RecentCellModel.swift
//  DataSource
//
//  Created by Bartosz Górka on 16/01/2023.
//

import UIKit

struct RecentCellModel: Equatable, Hashable {
    let id = UUID()
    let image = UIImage()
    let title: String
}
