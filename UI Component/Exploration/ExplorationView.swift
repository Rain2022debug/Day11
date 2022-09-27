//
//  ExplorationView.swift
//  UI Component
//
//  Created by Jian on 2022/1/21.
//

import SwiftUI

struct ExplorationView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: {
                    TimelineView()
                }, label: {
                    Label("朋友圈", systemImage: "circle.circle.fill")
                })
                NavigationLink(destination: {
                    GameView()
                }, label: {
                    Label("游戏", systemImage: "gamecontroller.fill")
                })
                Label("小程序", systemImage: "circle.dashed")
            }
            .navigationTitle("发现")
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(.stack)
    }
}

struct ExplorationView_Previews: PreviewProvider {
    static var previews: some View {
        ExplorationView()
    }
}
