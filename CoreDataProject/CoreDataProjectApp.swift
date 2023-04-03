//
//  CoreDataProjectApp.swift
//  CoreDataProject
//
//  Created by Maximilian Berndt on 2023/04/03.
//

import SwiftUI

@main
struct CoreDataProjectApp: App {
    
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
