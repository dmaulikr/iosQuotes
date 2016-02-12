//
//  QuoteLogic.swift
//  quotes
//
//  Created by Xavi on 11/02/16.
//  Copyright © 2016 mac33. All rights reserved.
//

import UIKit
import CoreData

class QuoteLogic{
    
    var text:String
    var author:String
    var background:String
    var authorImg:String?
    
    init(text:String, author:String, background:String){
        self.background = background
        self.text = text
        self.author = author
    }
    
    init(text:String, author:String, background:String, authorImg:String){
        self.background = background
        self.text = text
        self.author = author
        self.authorImg = authorImg
    }
    
    init?(json:[String:AnyObject] ) {
        if let text = json["quote"] as? String, let author = json["author"] as? String, let background = json["background"] as?  String, let authorImg = json["authorBackground"] as? String{
            
            self.background = background
            self.text = text
            self.author = author
            self.authorImg = authorImg
        }
        else {
            self.background = "https://theysaidso.com/img/bgs/man_on_the_mountain.jpg"
            self.text = "I know nothing"
            self.author = "John Snow"
        }
    }

    
    func saveQuote(){
        
    }
}