//
//  ProfileHeaderView.swift
//  UI Component
//
//  Created by Jiaxin Pu on 2022/9/6.
//

import SwiftUI

struct ProfileHeaderView: View {
    private enum Contants {
        static let imageSize: CGSize = .init(width: 60, height: 60)
    }
    
    @EnvironmentObject private var loginedModel: LoginedModelFromHomeView
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?
    var body: some View {
        HStack {
            Image(loginedModel.profile.avatarUrl)
                .resizable()
                .scaledToFill()
                .frame(width: Contants.imageSize.width, height: Contants.imageSize.height)
                .circle()
                
            
            VStack(alignment: .leading) {
                Text(loginedModel.profile.nickname)
                    .lineLimit(2)
                    .font(.title)
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                if horizontalSizeClass == .compact {
                    HStack {
                        Text("微信号:xxxxxxx")
                            .layoutPriority(1)
                            .lineLimit(1)
                            .font(.title3)
                            .foregroundColor(.gray)

                        Text("个性签名：123456789123456789")
                            .lineLimit(1)
                            .font(.title3)
                            .foregroundColor(.orange)
                    }
                }else {
                    Text("微信号:xxxxxxx")
                        .layoutPriority(1)
                        .lineLimit(1)
                        .font(.title3)
                        .foregroundColor(.gray)

                    Text("个性签名：123456789123456789")
                        .lineLimit(1)
                        .font(.title3)
                        .foregroundColor(.orange)
                }
                
            }
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static let loginedModel: LoginedModelFromHomeView = LoginedModelFromHomeView()
    
    static var previews: some View {
        ProfileHeaderView()
            .environmentObject(loginedModel)
    }
}


