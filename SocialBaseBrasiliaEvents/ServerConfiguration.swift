//
//  ServerConfiguration.swift
//  SocialBaseBrasiliaEvents
//
//  Created by Willian Pinho on 11/12/16.
//  Copyright © 2016 Willian Pinho. All rights reserved.
//

import Foundation

class ServerConfiguration {
    var host : String?
    var code : String?
    var amazonUrl1 : String?
    var amazonUrl2 : String?
    
    
    init() {
        host = "http://52.67.150.108/api/"
        code = "BSB"
        amazonUrl1 = "https://s3-sa-east-1.amazonaws.com/"
        amazonUrl2 = "https://s3-us-west-2.amazonaws.com/"
        
    }
    
}
