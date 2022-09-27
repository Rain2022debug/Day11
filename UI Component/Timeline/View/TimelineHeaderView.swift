//
//  TimelineHeaderView.swift
//  UI Component
//
//  Created by Jian on 2022/1/21.
//

import SwiftUI

struct TimelineHeaderView: View {
    private enum Contants {
        static let profileImageSize: CGSize = .init(width: 70, height: 70)
        static let nickAndProfileOffsetX: CGFloat = -15
        static let nickAndProfileOffsetY: CGFloat = 15
        static let contentBottoPadding: CGFloat = 20
    }
    
    let nickname: String
    let profileImageName: String
    let backgroundImageName: String
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Image(backgroundImageName)
                .resizable()
                .scaledToFill()
            HStack {
                Text(nickname)
                    .foregroundColor(.white)
                    .bold()
                Image(profileImageName)
                    .resizable()
                    .frame(width: Contants.profileImageSize.width,
                           height: Contants.profileImageSize.height)
            }
            .offset(x: Contants.nickAndProfileOffsetX, y: Contants.nickAndProfileOffsetY)
        }
        .padding(.bottom, Contants.contentBottoPadding)
    }
}

struct TimelineHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        TimelineHeaderView(nickname: "桃子猪2222222",
                           profileImageName: "timeline_profile_image",
                           backgroundImageName: "timeline_profile_background")
    }
}
