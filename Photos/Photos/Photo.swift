
//
//  Photo.swift
//  Photos
//
//  Created by Gene Yoo on 11/3/15.
//  Copyright © 2015 iOS DeCal. All rights reserved.
//

import Foundation

class Photo {
    /* The number of likes the photo has. */
    var likes : Int!
    /* The string of the url to the photo file. */
    var url : String!
    /* The username of the photographer. */
    var username : String!
    /* Date photo posted */
    var datePosted : NSDate!
    
    /* Parses a NSDictionary and creates a photo object. */
    init (data: NSDictionary) {
        // FILL ME IN
        // HINT: use nested .valueForKey() calls, and then cast using 'as! TYPE'
        
        self.likes = (data.valueForKey("likes") as! NSDictionary).valueForKey("count") as! Int
        let image = (data.valueForKey("images") as! NSDictionary).valueForKey("standard_resolution") as! NSDictionary
        self.url = image.valueForKey("url") as! String
        self.username = (data.valueForKey("user") as! NSDictionary).valueForKey("username") as! String
        let i = (data.valueForKey("created_time")) as! String
        self.datePosted = NSDate(timeIntervalSince1970: Double(i)!)
    }
    
}