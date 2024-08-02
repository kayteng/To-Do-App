//
//  ContentView.swift
//  To Do App
//
//  Created by Scholar on 7/30/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var showNewTask = false
    //links views, initially 2nd view is not shown
    @Query var toDos : [ToDoItem]
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        VStack {
            HStack (alignment : .top) {
                Text("To Do List")
                    .font(.system(size: 40))
                    .fontWeight(.black)
                Spacer()
                Button{
                    withAnimation{
                        self.showNewTask = true
                    }
                } label: {
                    Text("+")
                        .font(.system(size:40))
                        .fontWeight(.semibold)
                        .foregroundColor(Color(hue: 0.407, saturation: 0.58, brightness: 0.679))
                }
            }
            .padding()
            Spacer()
                List {
                    ForEach(toDos){toDoItem in
                        if toDoItem.isImportant == true {
                            Text(toDoItem.title + " ‼️")
                        } else {
                            Text(toDoItem.title)
                        }
                    }
                    .onDelete(perform: deleteToDo)
            }
                //.listStyle(.plain)
        }
        if showNewTask {
            NewToDoView(toDoItem: ToDoItem(title:"",isImportant:false), showNewTask:$showNewTask)
        }
    }
    func deleteToDo(at offsets: IndexSet){
        for offset in offsets {
            let toDoItem = toDos[offset]
            modelContext.delete(toDoItem)
        }
    }
}


#Preview {
    ContentView()
}
