

import SwiftUI

@main
struct BarcodeScannerApp: App {
    let persistentContainer = PersistentController.shared
    var body: some Scene {
        WindowGroup {
            FirstPage()
                .environmentObject(ConnectJSON.init())
                .environment(\.managedObjectContext,
                      persistentContainer.container.viewContext)
            
        }
    }
}
