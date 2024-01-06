//
//  CoreDataTaskApp.swift
//  CoreDataTask
//
//  Created by Utkirbek Mekhmonboev on 1/5/24.
//

import SwiftUI

@main
struct CoreDataTaskApp: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
