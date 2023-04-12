//
//  RequestManager.swift
//  iOSTask
//
//  Created by Nikol Vasileva on 12.04.23.
//

import Foundation
import Alamofire

class RequestManager {
    static func fetchData(completion: @escaping((_ error: String?, _ result: Article?) -> Void)) {

        AF.request("https://newsapi.org/v2/top-headlines?country=gb&apiKey=ae7b53e694c64d6c91f3f3dea1ccc414", method: .get).responseDecodable(of: News.self) { (newsDataResponse) in

            guard newsDataResponse.error == nil else {
                completion(newsDataResponse.error?.localizedDescription, nil)
                return
            }

            guard let responseValue = newsDataResponse.value else {
                completion("No valid response", nil)
                return
            }

            completion(nil, responseValue.articles.first)
        }

    }
}

