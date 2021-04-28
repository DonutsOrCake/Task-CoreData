//
//  Task+Convenience.swift
//  Task-CoreData
//
//  Created by Bryson Jones on 4/27/21.
//

import CoreData


extension Task {
    
    convenience init(name: String, notes: String?, dueDate: Date = Date(), context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.name = name
        self.notes = notes
        self.dueDate = dueDate
    }
}//End of extension
