//
//  APIService.swift
//  Couchto5k
//
//  Created by Taylor Chan on 5/2/18.
//  Copyright © 2018 Taylor Chan. All rights reserved.
//

import Foundation
import CoreData

enum Result <T> {
    case Success(T)
    case Error(String)
}

class APIService: NSObject {
    func getDataWith(completion: @escaping (Result<[[String: AnyObject]]>) -> Void){
        guard let path = Bundle.main.path(forResource: "workoutPlan", ofType: "json") else{
            return completion(.Error("Invalid filename for json"))
        }
        
        if let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe){
            do{
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: AnyObject] {
                    guard let itemsJsonArray = json["content"] as? [[String:AnyObject]] else {
                        return completion(.Error("There are no new items to show"))
                    }
                    DispatchQueue.main.async {
                        completion(.Success(itemsJsonArray))
                    }
                }
            }catch let error{
                return completion(.Error(error as! String))
            }
        } else {
            return
        }
    }
    
    func toCoreData(dictionary: [String: AnyObject]) -> NSManagedObject? {
        return nil
    }
}
