//
//  ContentView.swift
//  TodoApp
//
//  Created by Rathapol Putharaksa on 9/4/2564 BE.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) private var
        viewContext
    @FetchRequest(sortDescriptors:
                    [NSSortDescriptor(keyPath: \NutriDB.productName, ascending: false)])
    private var todosCD:
                  FetchedResults<NutriDB>
    
    //@EnvironmentObject private var todoList:TodoList
    @State private var showAddTodoView = false
    
    var body: some View {
        NavigationView{
        List{
            ForEach(todosCD, id: \.self){
                    
                todo in
                NavigationLink(
                    destination:
                        TodoView(todo: todo))  {
                HStack{
                   
                    Text(todo.productName ?? "untitled").bold()
                }
                }.onLongPressGesture {
                    updateTodo(todo: todo)
                }
                    
              
           }
            .onDelete{ indexSet in
                deleteTodo(offset: indexSet)
                
            }
        }
        
            
        .toolbar { EditButton() }
       
        }
   }
    
    private func deleteTodo(offset: IndexSet){
        for index in offset {
            let todo = todosCD[index]
            viewContext.delete(todo)
        }
        do {
            try viewContext.save()
        } catch {
            let error = error as NSError
            fatalError("unresolve error: \(error)")
        }
    }
    
    private func updateTodo(todo: FetchedResults<NutriDB>.Element){
        todo.productName = "eiei"
        do {
            try viewContext.save()
        } catch {
            let error = error as NSError
            fatalError("unresolve error: \(error)")
        }
    }
}

struct TodoView: View {
    var todo: NutriDB
    var textURL:String=""
    
    
    var body: some View {
        VStack{
        AsyncImage(
            url: URL(string: todo.imgURL ?? "")!,
            placeholder: {Text("Loading ...")}
                ).aspectRatio(contentMode: .fit)
        }
        VStack{
        
        
            HStack{
            Text("Name : ")
            
            
            Text(todo.productName ?? "").foregroundColor(.red).bold()
            
            }
            HStack{
            Text("NutritionGrade : ")
            
            Text(todo.nutritionGrade ?? "").foregroundColor(.red).bold()
            }
            HStack{
            
            Text("Energy Per 100g : ")
            Text(todo.energyPer100g ?? "").foregroundColor(.red).bold()
            Text("kcal")
            }
            HStack{
            Text("Quantity : ")
            Text(todo.quantity ?? "").foregroundColor(.red).bold()
            
            }
        }.padding()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(TodoList())
    }
}
