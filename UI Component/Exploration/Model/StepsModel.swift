//
//  StepsModel.swift
//  UI Component
//
//  Created by Jiaxin Pu on 2022/9/8.
//

import Foundation

class StepsModel: ObservableObject {
    @Published var steps: Int = 0
    
    init() {
        print("Model Created")
    }
}
