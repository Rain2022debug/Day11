//
//  ProfileView.swift
//  UI Component
//
//  Created by Jiaxin Pu on 2022/9/6.
//

import SwiftUI

struct ProfileView: View {
    let items: [ListItemModel] = [.init(icon: "message.and.waveform", title: "服务"),
                                     .init(icon: "shippingbox", title: "收藏"),
                                     .init(icon: "menucard", title: "卡包"),
                                     .init(icon: "gearshape", title: "设置")]
    var body: some View {
        NavigationView {
            List {
                Section {
                    NavigationLink(destination: ProfileAvatarModificationView()) {
                        ProfileHeaderView()
                    }
                }

                Section {
                    ForEach(items) { item in
                        if item.title == "设置" {
                            NavigationLink {
                                SettingsView()
                            } label: {
                                HStack {
                                    Image(systemName: item.icon)
                                    Text(item.title)
                                }
                            }
                        }else if item.title == "卡包" {
                            NavigationLink {
                                CardBagView()
                            } label: {
                                HStack {
                                    Image(systemName: item.icon)
                                    Text(item.title)
                                }
                            }
                        }else {
                            HStack {
                                Image(systemName: item.icon)
                                Text(item.title)
                            }
                        }
                    }
                }
            }
            .navigationTitle("我的")
            .navigationBarTitleDisplayMode(.inline)
        }.navigationViewStyle(.stack)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
