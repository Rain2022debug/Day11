//
//  TimelineContentViewModel.swift
//  UI Component
//
//  Created by Jiaxin Pu on 2022/9/8.
//

import Foundation
import Combine
import Alamofire

final class TimelineContentViewModel: ObservableObject {
    @Published private(set) var contents: [TimelineContent] = []
    let tweetURL = "https://thoughtworks-mobile-2018.herokuapp.com/user/jsmith/tweets"
    
    private let decoder = JSONDecoder()
    
    func loadData(profile: Profile) {
//        loadWithURLSession { content in
//            DispatchQueue.main.async{
//                self.contents = content
//            }
//        }
        
        loadWithAlamofire { content in
            self.contents = content
        }
    }
    
    private func loadWithURLSession(completion: @escaping ([TimelineContent]) -> ()) {
        guard let url = URL(string: tweetURL) else {
            completion([])
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else{
                completion([])
                return
            }
            do{
                let content = try self.decoder
                    .decode(Array<Catch<TimelineContent>>.self, from: data)
                    .compactMap { $0.value }
                completion(content)
            } catch{
                completion([])
                print("error: \(error)")
            }
        }
        task.resume()
    }
    
    private func loadWithAlamofire(completion: @escaping ([TimelineContent]) -> ()) {
        AF.request(tweetURL)
            .responseDecodable(of: Array<Catch<TimelineContent>>.self) { response in
                completion(response.value?.compactMap { $0.value } ?? [])
            }
    }
}
