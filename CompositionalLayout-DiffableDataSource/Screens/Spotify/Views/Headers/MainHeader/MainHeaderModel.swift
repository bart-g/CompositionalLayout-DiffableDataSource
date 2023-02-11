//
//  MainHeaderModel.swift
//  DataSource
//
//  Created by Bartosz Górka on 16/01/2023.
//

import Foundation

struct MainHeaderModel: Equatable, Hashable {
    let greeting: String
    let buttons: [MainHeaderButtonModel]
}
