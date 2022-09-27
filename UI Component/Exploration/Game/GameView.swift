//
//  GameView.swift
//  UI Component
//
//  Created by Jiaxin Pu on 2022/9/8.
//

import SwiftUI


struct GameView: View {
    @State private var date: Date = .init()
    var body: some View {
        VStack {
            Button("刷新时间") {
                date = Date()
            }
            
            Text("当前时间：\(date.description)")
            
            StepsPlate().padding(.top, 20)
        }
    }
}
