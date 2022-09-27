//
//  TimelineView.swift
//  UI Component
//
//  Created by Jian on 2022/1/21.
//

import SwiftUI

struct TimelineView: View {
    var body: some View {
        List {
            TimelineHeaderView(nickname: "桃子猪", profileImageName: "timeline_profile_image", backgroundImageName: "timeline_profile_background")
                .listRowInsets(EdgeInsets())
                .listRowSeparator(.hidden)
            TimelineContentView()
                .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        .navigationBarTitle("朋友圈")
    }
}

struct TimelineView_Previews: PreviewProvider {
    static var previews: some View {
        TimelineView()
    }
}
