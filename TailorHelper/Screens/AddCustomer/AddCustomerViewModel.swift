//
//  AddCustomerViewModel.swift
//  TailorHelper
//
//  Created by Hanh Vu on 2023/09/23.
//

import Foundation
import CoreData

final class AddCustomerViewModel: ObservableObject {
    @Published var customerName = ""
    @Published var itemName = ""
    @Published var itemDeadline = Date()
    let storageProvider = StorageProvider.shared
    let viewContext: NSManagedObjectContext
    let addCustomerContext: NSManagedObjectContext
    
    init() {
        viewContext = storageProvider.persistentContainer.viewContext
        addCustomerContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        addCustomerContext.parent = viewContext
    }
    
    func addCustomer() -> Customer {
        return storageProvider.addCustomer(withName: customerName, context: addCustomerContext)
    }
    
    func addItem() -> Item {
        return storageProvider.addItem(called: itemName, deliveredBy: itemDeadline, context: addCustomerContext)
    }
    
    func complete() {
        let newCustomer = addCustomer()
        let newItem = addItem()
        newCustomer.addToItems(newItem)
        do {
            try addCustomerContext.save()
        } catch {
        }
    }
}
