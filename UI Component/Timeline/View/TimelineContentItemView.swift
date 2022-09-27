//
//  TimelineContentItemView.swift
//  UI Component
//
//  Created by Jian on 2022/1/21.
//

import SwiftUI

struct TimelineContentItemView: View {
    private enum Contants {
        static let imageSize: CGSize = .init(width: 50, height: 50)
        static let nickSpacing: CGFloat = 10
        static let singlePhotoMaxWidth: CGFloat = 200
    }
    
    @StateObject private var viewModel: TimelineContentItemViewModel
    
    init(timelineContent: TimelineContent) {
        _viewModel = StateObject(wrappedValue: TimelineContentItemViewModel(timelineContent: timelineContent))
    }
    
    var body: some View {
        HStack(alignment: .top) {
            AsyncImage(url: URL(string: viewModel.profileImageURL), content: { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .frame(width: Contants.imageSize.width, height: Contants.imageSize.height)
                } else {
                    ProgressView()
                }
            })
                
            VStack(alignment: .leading, spacing: Contants.nickSpacing) {
                Text(viewModel.profileNick)
                    .bold()
                Text(viewModel.content)
                    .fontWeight(.light)
                if viewModel.showSinglePhotoName {
                    AsyncImage(url: URL(string: viewModel.singlePhotoURL), content: { phase in
                        if let image = phase.image {
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: Contants.singlePhotoMaxWidth)
                        } else {
                            ProgressView()
                        }
                    })
                }
                if viewModel.showLikes {
                    TimelinkContentLikeView(like: viewModel.likes)
                }
            }
            Spacer()
        }
    }
}

struct TimelineContentItemView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TimelineContentItemView(timelineContent: TimelineContent(id: 1, nickname: "桃子猪", avatarUrl: "timeline_profile_image", type: .singleMessage(message: "不是我矫情,这年呐~,就是得和家人一起过才有味道."), likes: [""]))
            TimelineContentItemView(timelineContent: TimelineContent(id: 1, nickname: "芒果🦒", avatarUrl: "timeline_profile_image_lu", type: .singlePhoto(photo: "timeline_profile_image_lu_photo1", message: "草莓兔最近移情别恋, 都好久不和我在一起玩了. 哼~生气"), likes: []))
            TimelineContentItemView(timelineContent: TimelineContent(id: 1, nickname: "芒果🦒", avatarUrl: "timeline_profile_image_lu", type: .singlePhoto(photo: "timeline_profile_image_lu_photo1", message: "草莓兔最近移情别恋, 都好久不和我在一起玩了. 哼~生气"), likes: ["草莓🐰"]))
        }
    }
}
