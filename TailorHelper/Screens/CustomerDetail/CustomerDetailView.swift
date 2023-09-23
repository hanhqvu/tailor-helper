//
//  CustomerDetailView.swift
//  TailorHelper
//
//  Created by Hanh Vu on 2023/09/23.
//

import SwiftUI
import CoreData
import Foundation

struct CustomerDetailView: View {
    @StateObject var viewModel: CustomerDetailViewModel

    var body: some View {
        NavigationView {
            VStack {
                List {
                    Section("Personal Information") {
                        Text("Name: \(viewModel.customer.name ?? "")")
                    }
                    
                    Section("Items") {
                    }
                    
                    Section("Measurments") {
                        Text("1")
                    }
                }
            }
            .navigationTitle("\(viewModel.customer.name ?? "")'s Details")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "camera.badge.ellipsis")
                    }
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "square.and.arrow.down.fill")
                    }
                }
            }
        }
    }
}
