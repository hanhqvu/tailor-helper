//
//  AddCustomerView.swift
//  TailorHelper
//
//  Created by Hanh Vu on 2023/09/23.
//

import SwiftUI

struct AddCustomerView: View {
    @StateObject private var viewModel = AddCustomerViewModel()
    @Binding var showSheet: Bool
    
    var body: some View {
        NavigationView {
            Form {
                Section("Customer Information") {
                    Text("What is the customer name?")
                        .font(.headline)
                    
                    TextField("John Appleseed", text: $viewModel.customerName)
                }
                
                Section("Item Information") {
                    Text("What is the item?")
                        .font(.headline)
                    
                    TextField("Jacket", text: $viewModel.itemName)
                    
                    Text("When does the customer wants the item delivered?")
                        .font(.headline)

                    DatePicker("Please enter a time", selection: $viewModel.itemDeadline, displayedComponents: .date)
                        .labelsHidden()
                }
            }
            .navigationTitle("Add Customer")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button {
                        showSheet.toggle()
                    } label: {
                        Text("Cancel")
                            .foregroundColor(.red)
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        viewModel.complete()
                        showSheet.toggle()
                    } label: {
                        Text("Add")
                            .foregroundColor(.green)
                    }
                }
            }
        }
    }
}

struct AddCustomerView_Previews: PreviewProvider {
    static var previews: some View {
        AddCustomerView(showSheet: .constant(true))
    }
}
