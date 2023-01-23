//
//  ContentView.swift
//  To Do List
//
//  Created by Dhanush Tipparaju on 1/23/23.
//

import SwiftUI

struct ContentView: View {
    @State private var things = ["First Thing", "Second Thing", "Fourth Thing", "Fifth Thing"]
    var body: some View {
        NavigationView {
            List {
                ForEach(things, id:\.self) { thing in
                    Text(thing)
                }
                .onMove { indices, newOffset in
                    things.move(fromOffsets: indices, toOffset: newOffset)
                }
                .onDelete { IndexSet in
                    things.remove(atOffsets: IndexSet)
                }
            }
            .navigationBarTitle("Things", displayMode: . inline)
            .navigationBarItems(leading: EditButton())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

