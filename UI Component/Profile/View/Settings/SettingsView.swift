//
//  SettingsView.swift
//  UI Component
//
//  Created by Jiaxin Pu on 2022/9/8.
//

import SwiftUI

struct SettingsView: View {
    private enum Contants {
        static let pageHeaderId: String = "pageHeaderId"
    }
    let items: [ListItemModel] = Array(repeating: .init(icon: "gearshape", title: "设置"), count: 20)
    var body: some View {
        ScrollViewReader { proxy in
            List {
                Text("Settings Page")
                    .id(Contants.pageHeaderId)
                
                ForEach(items) { item in
                    HStack {
                        Image(systemName: item.icon)
                        Text(item.title)
                    }
                }
                
                Button {
                    proxy.scrollTo(Contants.pageHeaderId)
                } label: {
                    Text("Back To Top")
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
