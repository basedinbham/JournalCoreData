//
//  EntryController.swift
//  JournalCoreData
//
//  Created by Kyle Warren on 7/26/21.
//

import CoreData

class EntryController {
    // Shared instance
    static let shared = EntryController()
    // SOT
    var entries: [Entry] = []
    
    private lazy var fetchRequest: NSFetchRequest<Entry> = {
        let request = NSFetchRequest<Entry>(entityName: "Entry")
        request.predicate = NSPredicate(value: true)
        return request
    }()
    
    //MARK: - CRUD
    
    func createEntry(title: String, bodyText: String) {
        let newEntry = Entry(title: title, bodyText: bodyText)
        EntryController.shared.entries.append(newEntry)
        
        CoreDataStack.saveContext()
    }
    
    func fetchEntires() {
        let entries = (try? CoreDataStack.context.fetch(fetchRequest)) ?? []
        self.entries = entries
        
        CoreDataStack.saveContext()
    }
    
    func updateEntry(entry: Entry, title: String, bodyText: String, timestamp: Date) {
        entry.title = title
        entry.bodyText = bodyText
        entry.timestamp = timestamp
        
        CoreDataStack.saveContext()
    }
    
//    func deleteEntry(entry: Entry){
//        guard let index = entries.firstIndex(of: entry) else { return }
//        entries.remove(at: index)
//
//        CoreDataStack.saveContext()
//    }
    
} // End of Class
