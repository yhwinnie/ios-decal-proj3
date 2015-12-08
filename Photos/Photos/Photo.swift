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
    var datePosted: NSDate!
    var dateCreated: String!

    /* Parses a NSDictionary and creates a photo object. */
    init (data: NSDictionary) {
        // FILL ME IN
        // HINT: use nested .valueForKey() calls, and then cast using 'as! TYPE'
        username = data.valueForKey("user")?.valueForKey("username") as! String
        url = data.valueForKey("images")?.valueForKey("thumbnail")?.valueForKey("url") as! String
        likes = data.valueForKey("likes")?.valueForKey("count") as! Int
        let timestamp = data.valueForKey("created_time") as! String
        self.datePosted = NSDate(timeIntervalSince1970: Double(timestamp)!)
        let format = NSDateFormatter()
        format.dateStyle = .MediumStyle
        self.dateCreated = format.stringFromDate(self.datePosted)
        
        }
    }



