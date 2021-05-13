

import SwiftUI

struct BarcodeScannerView: View {
    @Environment(\.openURL) var openURL
    @StateObject var viewModel = BarcodeScannerViewModel()
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var fetch :ConnectJSON
    @State private var showAddTodoView = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text(viewModel.statusText)
                    .bold()
                    .font(.largeTitle)
                    .foregroundColor(viewModel.statusTextColor)
                    .padding()
                
                ScannerView(scannedCode: $viewModel.scannedCode,
                            alertItem: $viewModel.alertItem)
                    .frame(maxHeight: 300)
                
                Spacer()
                    .frame(height: 60)
                
                
                
                
                Button(action: {showAddTodoView.toggle()
                    
                }){
                    Text("checkNutrition")
                    
                }
                .sheet(isPresented: $showAddTodoView){
                    NutritionView(scannedCode:viewModel.scannedCode,showAddTodoView: $showAddTodoView)
                }
                
              
                   
                
                
                
                
            }
               
            
        
            
           
        }
    }
}



