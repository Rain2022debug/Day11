//
//  CardView.swift
//  UI Component
//
//  Created by Jiaxin Pu on 2022/9/8.
//

import SwiftUI

struct CardBagView: View {
    @State var cardNumber: String = ""
    var body: some View {
        VStack {
            Text("当前的卡片号码：\(cardNumber)")
            
            TextField("请输入卡片号码", text: $cardNumber)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 20)
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardBagView()
    }
}
