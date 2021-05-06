//
//  NutritionJSONview.swift
//  BarcodeScanner
//
//  Created by Rathapol Putharaksa on 5/5/2564 BE.
//

import SwiftUI





struct NutritionJSONview: View {
    
    
    @Environment(\.openURL) var openURL

        var body: some View {
            Button("Visit Apple") {
                openURL(URL(string: "https://world.openfoodfacts.org/product/3274080005003")!)
            }
        }

}
        
