//
//  HeaderWithButtonsModel.swift
//  DataSource
//
//  Created by Bartosz Górka on 16/01/2023.
//

import Foundation

struct HeaderWithButtonsModel: Equatable, Hashable {
    let id = UUID()
    let buttonTitles: [String]
}
