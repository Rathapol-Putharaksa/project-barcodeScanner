//
//  TodoApp.swift
//  Todo
//
//  Created by Rathapol Putharaksa on 12/5/2564 BE.
//

import SwiftUI

 @main
 struct TodoAppApp: App {

        let persistentContainer = PersistentController.shared
        
        var body: some Scene {
            WindowGroup {
                ContentView()
                    .environmentObject(TodoList())
                    .environment(\.managedObjectContext,
                          persistentContainer.container.viewContext)
            }
        }
    }
