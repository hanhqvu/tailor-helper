//
//  TailorHelperApp.swift
//  TailorHelper
//
//  Created by Hanh Vu on 2023/09/23.
//

import SwiftUI

@main
struct TailorHelperApp: App {
    let viewContext = StorageProvider.shared.persistentContainer.viewContext
    @Environment(\.scenePhase) var scenePhase

    var body: some Scene {
        WindowGroup {
            CustomerListView()
                .environment(\.managedObjectContext, viewContext)
                .onChange(of: scenePhase) { _ in
                    StorageProvider.shared.save()
                }
        }
    }
}
