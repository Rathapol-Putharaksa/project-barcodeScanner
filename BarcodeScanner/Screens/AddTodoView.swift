//
//  AddTodoView.swift
//  Todo
//
//  Created by Rathapol Putharaksa on 12/5/2564 BE.
//

import SwiftUI

struct AddtodoView:View {
    @Environment(\.managedObjectContext) private var viewContext
    //@EnvironmentObject private var todoList:TodoList
    @State private var name = ""
    @State private var selectedCategory = 0
    @Binding var showAddTodoView: Bool
    
    private let categoryTypes = ["famiry","personal","work"]
    
    var body: some View{
        VStack{
            Text("Add todo").font(.largeTitle)
            TextField("Todo Name",text:$name).textFieldStyle(RoundedBorderTextFieldStyle())
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                .padding()
                Text("Select category")
            Picker("",selection:$selectedCategory){
                ForEach(0..<categoryTypes.count){
                    Text(categoryTypes[$0])
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            Button(action: {
                showAddTodoView = false
                
                let newTodoCD = NutriDB(context: viewContext)
                newTodoCD.productName = name
                newTodoCD.nutritionGrade =
                    ""
                do {
                    try viewContext.save()
                } catch {
                    let error = error as NSError
                    fatalError("Unresolved error : \(error)")
            }
            })  {
                Text("Done")
            }
            
        .padding()
    }
}

}
struct AddTodoView_Previews: PreviewProvider {
    static var previews: some View {
        AddtodoView(showAddTodoView: .constant(true))
            .environmentObject(TodoList())
    }
}
