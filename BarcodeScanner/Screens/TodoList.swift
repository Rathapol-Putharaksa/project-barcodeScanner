//
//  TodoList.swift
//  Todo
//
//  Created by Rathapol Putharaksa on 12/5/2564 BE.
//

import Foundation

class TodoList:ObservableObject{
    @Published var todos: [Todo] = [
        
    ]
    
    func saveList(productName:String,nutritionGrade:String,imgURL:String,energyPer100g:String,quantity:String){
        todos.append(Todo(productName: productName, nutritionGrade: nutritionGrade, imgURL: imgURL, energyPer100g: energyPer100g, quantity: quantity))
    }
}
