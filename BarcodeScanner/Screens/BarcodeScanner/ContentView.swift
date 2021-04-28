//
//  ContentView.swift
//  BarcodeScanner
//
//  Created by Rathapol Putharaksa on 28/4/2564 BE.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = BarcodeScannerViewModel()
    var body: some View {
        NavigationView {
                   VStack {
                    NavigationLink(destination: BarcodeScannerView()) {
                           Text("Scan barcode")
                       }
                       
                   }
               }
       
    }
}



