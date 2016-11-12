//
//  Event.swift
//  SocialBaseBrasiliaEvents
//
//  Created by Willian Pinho on 11/12/16.
//  Copyright © 2016 Willian Pinho. All rights reserved.
//

import Foundation
import RealmSwift

class Event: Object {
    
    dynamic var id                      : String? = nil
    dynamic var eventDescription        : String? = nil
    dynamic var eventName               : String? = nil
    dynamic var eventPhone              : String? = nil
    dynamic var eventCoverImage         : NSData? = nil
    dynamic var eventCover              : String? = nil
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
