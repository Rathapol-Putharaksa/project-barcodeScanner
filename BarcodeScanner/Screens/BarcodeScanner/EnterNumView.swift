//
//  EnterNumView.swift
//  BarcodeScanner
//
//  Created by Rathapol Putharaksa on 6/5/2564 BE.
//

import SwiftUI

struct EnterNumView: View {
    @State var numCode: String = ""
    @EnvironmentObject var fetch: ConnectJSON
    var body: some View {
        NavigationView{
        VStack{
            TextField("Enter 13 digit", text: $numCode)
            
                NavigationLink(
                    destination: NutritionView(scannedCode:numCode),
                    label: {
                        Text("check nutrition")
                    })
            }
}.textFieldStyle(RoundedBorderTextFieldStyle())
}
}

struct EnterNumView_Previews: PreviewProvider {
    static var previews: some View {
        EnterNumView()
            .environmentObject(ConnectJSON())
            
    }
}
