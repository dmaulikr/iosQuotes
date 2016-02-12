//
//  Quote+CoreDataProperties.swift
//  quotes
//
//  Created by mac33 on 5/2/16.
//  Copyright © 2016 mac33. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Quote {

    @NSManaged var text: String?
    @NSManaged var author: String?
    @NSManaged var background: String?
    @NSManaged var authorImg: String?

}
