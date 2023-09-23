//
//  Persistence.swift
//  TailorHelper
//
//  Created by Hanh Vu on 2023/09/23.
//

import CoreData

class StorageProvider {
    static let shared = StorageProvider()
    
    let persistentContainer: NSPersistentContainer
    
    init() {
        persistentContainer = NSPersistentContainer(name: "TailorHelper")
        
        persistentContainer.loadPersistentStores(completionHandler: { description, error in
            if let error = error {
                fatalError("Core Data store failed to load with error: \(error)")
            }
        })
    }
}

extension StorageProvider {
    func save() {
        let context = persistentContainer.viewContext
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                //Error persisting
                context.rollback()
            }
        }
    }
}

extension StorageProvider {
    func addCustomer(withName name: String, context: NSManagedObjectContext) -> Customer {
        let customer = Customer(context: context)
        customer.name = name
        return customer
    }
    
    func addItem(called name: String, needToDeliverBy deadline: Date, context: NSManagedObjectContext) -> Item {
        let item = Item(context: context)
        item.name = name
        item.deadline = deadline
        return item
    }
    
    func addItem(_ item: Item, customer: Customer) {
        customer.addToItems(item)
    }
}

