

import SwiftUI

struct BarcodeScannerView: View {
    
    @StateObject var viewModel = BarcodeScannerViewModel()
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
            VStack {
                
               
                ScannerView(scannedCode: $viewModel.scannedCode,
                            alertItem: $viewModel.alertItem)
                    .frame(maxHeight: 300)
                
                Spacer()
                    .frame(height: 60)
                
                
                NavigationLink(destination: NutritionView(scannedCode: viewModel.scannedCode)) {
                       Text("check Nutrition")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                   }
                Text(viewModel.statusText)
                    .bold()
                    .font(.largeTitle)
                    .foregroundColor(viewModel.statusTextColor)
                    .padding()
                
                
                
                
            }
            
        
            
           
        }
    }
}



