//
//  StepsPlane.swift
//  UI Component
//
//  Created by Jiaxin Pu on 2022/9/8.
//

import SwiftUI


struct StepsPlate: View {

//    @ObservedObject var model = StepsModel()
    @StateObject var model = StepsModel()
    
    init() {
        print("StepsPlate Created")
    }

    var body: some View {
        VStack {
            Button("+1") {
                model.steps += 1
                print("当前步数: \(model.steps)")
            }
            Text("步数: \(model.steps)")
        }
    }
}

struct StepsPlate_Previews: PreviewProvider {
    static var previews: some View {
        StepsPlate()
    }
}
