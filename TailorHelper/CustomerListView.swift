//
//  ContentView.swift
//  TailorHelper
//
//  Created by Hanh Vu on 2023/09/23.
//

import SwiftUI

struct CustomerListView: View {
    @FetchRequest(fetchRequest: Customer.customersByDeadline)
    var customers: FetchedResults<Customer>
    
    var body: some View {
        NavigationView {
            List {
            }
            .toolbar {
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CustomerListView()
    }
}
