//
//  HeaderModel.swift
//  DataSource
//
//  Created by Bartosz Górka on 16/01/2023.
//

import Foundation

struct HeaderModel: Equatable, Hashable {
    let id = UUID()
    let title: String
}
