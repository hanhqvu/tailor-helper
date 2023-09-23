//
//  Customer+Ext.swift
//  TailorHelper
//
//  Created by Hanh Vu on 2023/09/23.
//

import CoreData

extension Customer {
    // fetch request with different sort
    static var customersByDeadline: NSFetchRequest<Customer> = {
        let request: NSFetchRequest<Customer> = Customer.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(keyPath: \Customer.deadline, ascending: true)]
        
        return request
    }()
}
