//
//  Network.swift
//  quotes
//
//  Created by mac33 on 5/2/16.
//  Copyright © 2016 mac33. All rights reserved.
//

import UIKit

class Network{

    var baseURL:NSURL
    
    init(baseURL:NSURL) {
        self.baseURL = baseURL
    }
    
    func getRandomQuote(completionHandler:(user:User?) -> Void) {
        
        let session = NSURLSession.sharedSession()
        let request = NSMutableURLRequest(URL: baseURL)
        
        let task = session.dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
            if (error == nil) {
                if let jsonArray = self.parseJSONFromData(data!) {
                    if let user = self.parseUserFromJSON(jsonArray) {
                        completionHandler(user: user)
                    }
                    else {
                        completionHandler(user: nil)
                    }
                }
                else {
                    completionHandler(user: nil)
                }
            } else {
                completionHandler(user: nil)
            }
        })
        task.resume()
    }
    
    func parseJSONFromData(data:NSData) -> [String:AnyObject]? {
        var json = [String:AnyObject]()
        do {
            json = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions()) as! [String:AnyObject]
            return json
        } catch {
            print(error)
            return nil
        }
    }
    
    func parseQuoteFromJSON(json:[String:AnyObject]) -> User? {
        if let contents = json["contents"] as? [[String:AnyObject]] {
            if let quoteObj = contents[0] as? [[String:AnyObject]] {
                
                if let user = User(json: quoteObj) {
                    return user
                }
            
        }
        return nil
    }
    
    
    static func downloadImageFromUrl(URL:NSURL) -> UIImage{
        if let data = NSData(contentsOfURL: URL){
            return UIImage(data: data)!
        }
        return UIImage(named: "profile_bg")!
    }
}