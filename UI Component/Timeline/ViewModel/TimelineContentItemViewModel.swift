//
//  TimelineContentItemViewModel.swift
//  UI Component
//
//  Created by Jiaxin Pu on 2022/9/8.
//

import Foundation

final class TimelineContentItemViewModel: ObservableObject {
    @Published private(set) var profileImageURL: String = ""
    @Published private(set) var profileNick: String = ""
    @Published private(set) var content: String = ""
    @Published private(set) var showSinglePhotoName: Bool = false
    @Published private(set) var singlePhotoURL: String = ""
    @Published private(set) var showLikes: Bool = false
    @Published private(set) var likes: [String] = []
    
    init(timelineContent: TimelineContent) {
        profileImageURL = timelineContent.avatarUrl
        profileNick = timelineContent.nickname
        
        switch timelineContent.type {
        case .singleMessage(let message):
            content = message
            showSinglePhotoName = false
            break
        case .singlePhoto(let photo, let message):
            content = message ?? ""
            showSinglePhotoName = true
            singlePhotoURL = photo
        }
        
        showLikes = timelineContent.likes.count > 0
        likes.append(contentsOf: timelineContent.likes)
    }
}
