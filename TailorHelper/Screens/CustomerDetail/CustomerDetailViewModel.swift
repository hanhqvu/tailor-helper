//
//  CustomerDetailViewModel.swift
//  TailorHelper
//
//  Created by Hanh Vu on 2023/09/23.
//

import CoreData

final class CustomerDetailViewModel: ObservableObject {
    @Published var customer: Customer
    let storageProvider = StorageProvider.shared
    let viewContext: NSManagedObjectContext
    let detailContext: NSManagedObjectContext?

    init(sourceCustomer: Customer) {
        guard let viewContext = sourceCustomer.managedObjectContext else {
            fatalError("Attempting to edit a managed object that's not associated with a context")
        }

        self.viewContext = viewContext
        let detailContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        detailContext.parent = viewContext

        if let childCustomer = try? detailContext.existingObject(with: sourceCustomer.objectID) as? Customer {
            self.detailContext = detailContext
            self.customer = childCustomer
        } else if let childCustomer = detailContext.insertedObjects.first(where: { $0 == sourceCustomer }) as? Customer {
            self.detailContext = detailContext
            self.customer = childCustomer
        } else {
            self.detailContext = nil
            self.customer = sourceCustomer
        }
    }

    func complete() {
        guard let detailContext = detailContext else { return }
        do {
            try detailContext.save()
        } catch {
        }
    }
}
