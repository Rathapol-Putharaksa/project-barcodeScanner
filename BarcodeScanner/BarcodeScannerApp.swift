

import SwiftUI

@main
struct BarcodeScannerApp: App {
    var body: some Scene {
        WindowGroup {
            FirstPage()
                .environmentObject(ConnectJSON.init())
        }
    }
}
