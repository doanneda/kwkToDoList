//
//  NewToDoView.swift
//  ToDoList
//
//  Created by Scholar on 5/7/24.
//

import SwiftUI

struct NewToDoView: View {
    var body: some View {
        VStack (spacing: 50) {
            Text("Task title: ")
                .font(.title2)
                .fontWeight(.semibold)
            TextField("Enter the task description...", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
            Toggle(isOn: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Is On@*/.constant(true)/*@END_MENU_TOKEN@*/) {
                Text("Is it important?")
            }
            Button {

            } label: {
                Text("Save")
                    .foregroundColor(Color.red)
            }
        }
        .padding()
    }
}

#Preview {
    NewToDoView()
}
