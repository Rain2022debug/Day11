//
//  TimelineContentView.swift
//  UI Component
//
//  Created by Jian on 2022/1/21.
//

import SwiftUI

struct TimelineContentView: View {
    @EnvironmentObject private var loginedModel: LoginedModelFromHomeView
    @StateObject private var viewModel: TimelineContentViewModel = .init()
    
    var body: some View {
        VStack {
            VStack {
                ForEach(viewModel.contents) {
                    TimelineContentItemView(timelineContent: $0)
                }
            }
            .onAppear {
                viewModel.loadData(profile: loginedModel.profile)
            }
        }
    }
}

struct TimelineContentView_Previews: PreviewProvider {
    static var previews: some View {
        TimelineContentView()
    }
}
