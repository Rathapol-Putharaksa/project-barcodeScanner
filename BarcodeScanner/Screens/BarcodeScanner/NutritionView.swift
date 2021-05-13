

import SwiftUI

struct NutritionView: View {
    @Environment(\.managedObjectContext) private var viewContext
    var scannedCode: String = ""
    @EnvironmentObject var fetch :ConnectJSON
    @Environment(\.openURL) var openURL
    @Binding var showAddTodoView: Bool
    let posters = [
        ConnectJSON.imgURL
    ].map { URL(string: $0)! }
    @State private var Home = true
    
    
    var body: some View {
        if Home{
        VStack{
            Button(action: {Home = false}, label: {
                Image(systemName:"chevron.backward")
                Text("Back")
            })
            .padding(.trailing, 300.0)
        Text( fetch.loadData(scannedCode: scannedCode))
            
        VStack{
            List(posters, id: \.self) { url in
                AsyncImage(
                    url: url,
                    placeholder: { Text("Loading ...") },
                    image: { Image(uiImage: $0).resizable() }
                )
                
            }.frame(width: 400, height: 400, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            
        }
            
            
            VStack{
                HStack{
                Text("Name : ")
                
                
                Text(ConnectJSON.productName).foregroundColor(.red).bold()
                }
                HStack{
                
                
                Text("NutritionGrade : ")
                
                Text(ConnectJSON.nutritionGrade).foregroundColor(.red).bold()
                }
                HStack{
                
                Text("Energy Per 100g : ")
                Text(ConnectJSON.energyPer100g).foregroundColor(.red).bold()
                    Text("kcal")
                }
                HStack{
                
                Text("Quantity : ")
                Text(ConnectJSON.quantity).foregroundColor(.red).bold()
                
                }
            }
    
        }.padding()
            Button(action: {
                showAddTodoView = false
                
                let newTodoCD = NutriDB(context: viewContext)
                newTodoCD.productName = ConnectJSON.productName
                newTodoCD.nutritionGrade =
                    ConnectJSON.nutritionGrade
                newTodoCD.imgURL = ConnectJSON.imgURL
                newTodoCD.energyPer100g = ConnectJSON.energyPer100g
                newTodoCD.quantity = ConnectJSON.quantity
                do {
                    try viewContext.save()
                } catch {
                    let error = error as NSError
                    fatalError("Unresolved error : \(error)")
                }
                Home = false
            })  {
                Text("Save")
            }
            
        }
        else{
            FirstPage()
        }
        
    }
}
    


