//
//  ContentView.swift
//  TailorHelper
//
//  Created by Hanh Vu on 2023/09/23.
//

import SwiftUI

struct CustomerListView: View {
    @FetchRequest(fetchRequest: Customer.customersByDeadline)
    private var customers: FetchedResults<Customer>
    @State private var showSheet = false
    
    var body: some View {
        NavigationStack {
            List(customers) { customer in
                NavigationLink(value: customer) {
                    Text(customer.name ?? "")
                }
            }
            .navigationTitle("Customers")
            .navigationDestination(for: Customer.self) { customer in
                CustomerDetailView(viewModel: CustomerDetailViewModel(sourceCustomer: customer))
            }
            .toolbar {
                ToolbarItem {
                    Button {
                        showSheet.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        .sheet(isPresented: $showSheet) {
            AddCustomerView(showSheet: $showSheet)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CustomerListView()
    }
}
