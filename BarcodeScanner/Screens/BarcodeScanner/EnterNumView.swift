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
    @State private var showAddTodoView = false
    var body: some View {
        NavigationView{
        VStack{
            TextField("Enter 13 digit", text: $numCode)
            
                NavigationLink(
                    destination: NutritionView(scannedCode:numCode,showAddTodoView: $showAddTodoView),
                    label: {
                        Text("")
                    })
            Button(action: {showAddTodoView.toggle()
                
            }){
                Text("checkNutrition")
                
            }
            .sheet(isPresented: $showAddTodoView){
                NutritionView(scannedCode:numCode,showAddTodoView: $showAddTodoView)
            }
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
