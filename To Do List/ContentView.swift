//
//  ContentView.swift
//  To Do List
//
//  Created by Dhanush Tipparaju on 1/23/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var toDoList = ToDoList()
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(toDoList.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.priority)
                                .font(.headline)
                            Text(item.description)
                        }
                        Spacer()
                        Text(item.dueDate, style: .date)
                    }
                }
                .onMove {indices, newOffset in
                    toDoList.items.move(fromOffsets: indices, toOffset: newOffset)
                }
                .onDelete { IndexSet in
                    toDoList.items.remove(atOffsets: IndexSet)
                }
            }
            .navigationBarTitle("To Do List", displayMode: .inline)
            .navigationBarItems(leading: EditButton())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ToDoItem: Identifiable {
    var id = UUID()
    var priority: String
    var description: String
    var dueDate = Date()
}
