//
//  ContentView.swift
//  todolist
//
//  Created by Jimin Huh on 10/17/20.
//  Copyright © 2020 Jimin Huh. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject var taskStore = TaskStore()
    @State var newTodo: String = ""
    var searchBar: some View {
        HStack {
            TextField("Enter in a new task", text: self.$newTodo)
            Button(action: self.addNewToDo, label: {
                Text("Add New")
            })
        }
    }
    
    func addNewToDo() {
        taskStore.tasks.append(Task(id: String(taskStore.tasks.count + 1), toDoItem: newTodo))
        self.newTodo = ""
    }
    
    var body: some View {
        NavigationView {
            VStack {
                searchBar.padding()
                List {
                    ForEach(self.taskStore.tasks) {
                        task in
                        Text(task.toDoItem)
                    }.onMove(perform: self.move)
                        .onDelete(perform: self.delete)
                }.navigationBarTitle("Tasks")
                .navigationBarItems(trailing: EditButton())
            }
        }
    }
    
    func move(from source: IndexSet, to destination: Int) {
        taskStore.tasks.move(fromOffsets: source, toOffset: destination)
    }
    
    func delete(at offsets: IndexSet) {
        taskStore.tasks.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
