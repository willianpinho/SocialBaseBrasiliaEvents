//
//  Requests.swift
//  SocialBaseBrasiliaEvents
//
//  Created by Willian Pinho on 11/12/16.
//  Copyright © 2016 Willian Pinho. All rights reserved.
//

import Foundation
import Alamofire
import RealmSwift

class Requests {
    let sc = ServerConfiguration()
    
    //Method for create Cover URL String
    func createCoverUrl(_ coverObject: String) -> String {
        var coverUrl = String()
        
        coverUrl = sc.amazonUrl2! + "bs.cover/" + coverObject
        
        return coverUrl
    }
    
    //Method for create Thumb URL String
    func createThmbUrl(_ thumbObject: String) -> String {
        var thumbUrl = String()
        
        thumbUrl = sc.amazonUrl2! + "bs.thumb/" + thumbObject
        
        return thumbUrl
    }
    
    func convertUNIXJsonDate(_ jsonValue: Double) -> NSDate {
        return NSDate(timeIntervalSince1970: jsonValue/1000)
        
    }
    
    
    func fetchAllEventsFromServer() {
        Alamofire.request(sc.host! + sc.code! + "/event.json").responseJSON { (responseData) -> Void in
            if ((responseData.result.value) != nil) {
                if let events = responseData.result.value as? [String: AnyObject], let allEvents = events["data"] as? [[String: AnyObject]] {
                    for eventDic in allEvents {
                        let currentEvent = Event()
                        
                        if (eventDic["id"] == nil) {
                            currentEvent.id = nil
                        } else {
                            var currentEventIdDictionary = NSDictionary()
                            
                            currentEventIdDictionary = eventDic["id"] as! NSDictionary
                            
                            for (key,value) in currentEventIdDictionary {
                                currentEvent.id = value as? String
                            }
                            
                        }
                        
                        if (eventDic["name"] == nil) {
                            currentEvent.eventName = nil
                        } else {
                            currentEvent.eventName = eventDic["name"] as? String
                        }

                        if (eventDic["phone"] == nil) {
                            currentEvent.eventPhone = nil
                        } else {
                            currentEvent.eventPhone = eventDic["phone"] as? String
                        }
                        
                        if (eventDic["cover"] == nil) {
                            currentEvent.eventCover = nil
                        } else {
                            var coverUrl = String()
                            
                            coverUrl = self.createCoverUrl((eventDic["cover"] as? String)!)
                            
                            currentEvent.eventCover = coverUrl
                        }
                        
                        if (eventDic["description"] == nil) {
                            currentEvent.eventDescription = nil
                        } else {
                            currentEvent.eventDescription = eventDic["description"] as? String
                            
                        }
            
                        
                        
                        try! realm.write {
                            realm.add(currentEvent, update: true)
                        }
                        
                        
                    }
                }
            }
        }
        
    }
    
}
