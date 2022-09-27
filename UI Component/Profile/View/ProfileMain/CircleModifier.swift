//
//  CircleModifier.swift
//  UI Component
//
//  Created by Jiaxin Pu on 2022/9/6.
//

import Foundation
import SwiftUI

struct CircleModifier: ViewModifier {
    @State var lineWidth = CGFloat(4)
    @State var shadowRadius = CGFloat(7)
    func body(content: Content) -> some View {
        content
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.orange, lineWidth: lineWidth)
            }
            .shadow(radius: shadowRadius)
            .animation(.default.repeatForever(), value: lineWidth)
            .animation(.default.repeatForever(), value: shadowRadius)
            .onAppear {
                lineWidth = 2
                shadowRadius = 3
            }
    }
}

extension View {
    func circle() -> some View {
        modifier(CircleModifier())
    }
}
