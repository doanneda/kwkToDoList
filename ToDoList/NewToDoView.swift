//
//  NewToDoView.swift
//  ToDoList
//
//  Created by Scholar on 5/7/24.
//

import SwiftUI
import SwiftData

struct NewToDoView: View {
    
    @Bindable var toDoItem: ToDoItem
    @Environment(\.modelContext) var modelContext
    @Binding var showNewTask: Bool
    
    var body: some View {
        VStack (spacing: 50) {
            Text("Task title: ")
                .font(.title2)
                .fontWeight(.semibold)
            TextField("Enter the task description...", text: $toDoItem.title, axis: .vertical)
            Toggle(isOn: $toDoItem.isImportant) {
                Text("Is it important?")
                    .padding()
            }
            Button {
                addToDo()
                self.showNewTask = false
            } label: {
                Text("Save")
                    .foregroundColor(Color.red)
            }
        }
        .padding()
    }
    func addToDo() {
        let toDo = ToDoItem(title: toDoItem.title, isImportant: toDoItem.isImportant)
        modelContext.insert(toDo)
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: ToDoItem.self, configurations: config)

    let toDo = ToDoItem(title: "Example ToDo", isImportant: false)
    return NewToDoView(toDoItem: toDo, showNewTask: .constant(true))
        .modelContainer(container)
}
