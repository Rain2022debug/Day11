//
//  ProfileItemModel.swift
//  UI Component
//
//  Created by Jiaxin Pu on 2022/9/6.
//

import Foundation

struct ListItemModel: Identifiable {
    let icon: String
    let title: String
    var id: String {
        return title
    }
}
