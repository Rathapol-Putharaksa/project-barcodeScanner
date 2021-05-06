//
//  FirstPage.swift
//  BarcodeScanner
//
//  Created by Rathapol Putharaksa on 6/5/2564 BE.
//

import SwiftUI

struct FirstPage: View {
    var body: some View {
        TabView {
            BarcodeScannerView()
            
             .tabItem {
                Image(systemName: "barcode.viewfinder")
                Text("Scan")
           }
            
            EnterNumView()
             .tabItem {
                Image(systemName: "magnifyingglass")
                Text("Enter 13 Digit")
             }
        }
        .padding(0.0)
    }
}

struct FirstPage_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FirstPage()
            FirstPage()
        }
    }
}
