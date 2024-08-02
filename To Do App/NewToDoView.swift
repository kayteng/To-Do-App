//
//  NewToDoView.swift
//  To Do App
//
//  Created by Scholar on 7/30/24.
//

import SwiftUI
import SwiftData

struct NewToDoView: View {
    
    @Bindable var toDoItem: ToDoItem
    @Environment(\.modelContext) var modelContext
    @Binding var showNewTask: Bool
    
    var body: some View {
        VStack{
            Text("Task Title:")
                .font(.system(size:20))
                .fontWeight(.medium)
            TextField("Enter Task Description", text: $toDoItem.title, axis:.vertical)
                .padding()
                .background(Color(.systemGroupedBackground))
                .cornerRadius(15)
                .padding()
            Toggle(isOn: $toDoItem.isImportant) {
                Text ("Is it important?")
            } .tint(.red)
            
            Button {
                addToDo()
                self.showNewTask = false
            } label:{
                Text("Save")
                    .buttonStyle(.borderedProminent)
                    .foregroundStyle(.red)
                    
            }
        }
        .padding()
    }
    func addToDo(){
        let toDo = ToDoItem(title:toDoItem.title, isImportant:toDoItem.isImportant)
        modelContext.insert(toDo)
    }
}

//#Preview {
//    NewToDoView()
//}
