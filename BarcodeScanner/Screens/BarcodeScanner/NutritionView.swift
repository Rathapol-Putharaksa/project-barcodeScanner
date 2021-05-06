

import SwiftUI

struct NutritionView: View {
    var scannedCode: String = ""
    @State var  reload = 1
    @EnvironmentObject var fetch :ConnectJSON
    let secondsToDelay = 5.0
    @Environment(\.openURL) var openURL
    var body: some View {
        Text( fetch.loadData(scannedCode: scannedCode))
        VStack{
            
            
            
            
            
            
            
            
            HStack{
                
                Text("Name : ")
                
                
                Text(ConnectJSON.productName).foregroundColor(.red).bold()
            }
            Text("")
            Text("")
            Text("")
            HStack{
                Text("NutritionGrade : ")
                Text(ConnectJSON.nutritionGrade).foregroundColor(.red).bold()
                Text("                                                       ")
            }
            
        }
        
    }
    
}

