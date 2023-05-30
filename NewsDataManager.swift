//
//  NewsDataManager.swift
//  iOSTask
//
//  Created by Nikol Vasileva on 12.04.23.
//

import Foundation
import RealmSwift

class NewsDataManager {
    static let realm = try! Realm(configuration: realmConfig)
    
    class func dropDatabase() {
        try? realm.write {
            realm.deleteAll()
        }
    }
    
    static var realmConfig: Realm.Configuration {
        var config = Realm.Configuration()
        config.deleteRealmIfMigrationNeeded = true
        config.schemaVersion = 1
        return config
        
    }
    
    static func updateNewsData() {
        RequestManager.fetchData { error, result in
            guard error == nil else {
                print("Error in fetching data")
                return
            }
            
            guard let result = result else {
                print("Cannot parse data")
                return
            }
            
            DispatchQueue.main.async {
                NewsDataManager.realm.beginWrite()
                NewsDataManager.realm.add(result, update: .all)
                try? NewsDataManager.realm.commitWrite()
                NotificationCenter.default.post(name: .dataUpdatedNotification, object: nil)
            }
        }
    }
    
    static func getNewsData() -> [Article] {
        return Array(NewsDataManager.realm.objects(Article.self))
    }
    
}
