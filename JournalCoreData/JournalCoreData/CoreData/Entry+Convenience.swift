//
//  Entry+Convenience.swift
//  JournalCoreData
//
//  Created by Kyle Warren on 7/26/21.
//

import CoreData

extension Entry {
    
    @discardableResult
    convenience init(title: String, bodyText: String, timestamp: Date = Date(), context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.title = title
        self.bodyText = bodyText
        self.timestamp = timestamp
    }
    
} // End of Extension


