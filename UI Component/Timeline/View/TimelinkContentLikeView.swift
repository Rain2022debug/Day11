//
//  TimelinkContentLikeView.swift
//  UI Component
//
//  Created by Jian on 2022/1/21.
//

import SwiftUI

struct TimelinkContentLikeView: View {
    let like: [String]
    
    var body: some View {
        HStack {
            Image(systemName: "heart")
                .foregroundColor(.white)
            ForEach(like, id: \.self) { item in
                Text(item)
                    .foregroundColor(.white)
            }
            Spacer()
        }
        .background(.gray)
    }
}

struct TimelinkContentLikeView_Previews: PreviewProvider {
    static var previews: some View {
        TimelinkContentLikeView(like: ["草莓🐰"])
    }
}
