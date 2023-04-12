//
//  News.swift
//  iOSTask
//
//  Created by Nikol Vasileva on 12.04.23.
//

import Foundation
import RealmSwift
import Realm


class News: Codable {
    var status: String
    var totalResults: Int
    var articles: [Article] = []
}

class Article: Object, Codable {
    @Persisted var source: Source?
    @Persisted var author: String
    @Persisted(primaryKey: true) var title: String
    @Persisted var url: String
    @Persisted var urlToImage: String?
    @Persisted var publishedAt: String
    @Persisted var content: String?
}

class Source: Object, Codable {
    @Persisted var id: Source.ID.RawValue?
    @Persisted var name: Source.Name.RawValue?
}

//extension Article {
//    var ePublishedAt:Date {
////        return Date(timeIntervalSince1970: TimeInterval.double(self.ePublishedAt))
//    }
//}

extension Source {
    enum ID: String {
        case googleNews = "google-news"
        case unknowed = ""
    }

    enum Name: String {
        case dailyMail = "Daily Mail"
        case googleNews = "Google News"
        case iflScience = "IFLScience"
        case youTube = "YouTube"
        case unknowed = ""
    }

}
