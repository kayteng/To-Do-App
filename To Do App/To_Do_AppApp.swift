//
//  To_Do_AppApp.swift
//  To Do App
//
//  Created by Scholar on 7/30/24.
//

import SwiftUI
import SwiftData

@main
struct To_Do_AppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: ToDoItem.self)
        }
    }
}
