//
//  ContentView.swift
//  UI Component
//
//  Created by Jian on 2022/1/21.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var loginedModel: LoginedModelFromHomeView = LoginedModelFromHomeView()
    @State private var selectionTab: HomeTab = .exploration
    
    var body: some View {
        TabView(selection: $selectionTab) {
            Text("微信页面")
                .tabItem {
                    Label("微信", systemImage: "message.fill")
                }
                .tag(HomeTab.chat)
            Text("通讯录页面")
                .tabItem {
                    Label("通讯录", systemImage: "phone.fill")
                }
                .tag(HomeTab.addressList)
            ExplorationView()
                .tag("发现")
                .tabItem {
                    Label("发现", systemImage: "safari.fill")
                }
                .tag(HomeTab.exploration)
            ProfileView()
                .tabItem {
                    Label("我", systemImage: "person.fill")
                }
                .tag(HomeTab.me)
        }
        .environmentObject(loginedModel)
    }
}

enum HomeTab {
    case chat
    case addressList
    case exploration
    case me
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
