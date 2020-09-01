//
//  ContentView.swift
//  TaskList
//
//  Created by Nitin Yadav on 01/09/20.
//  Copyright © 2020 Nitin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var taskStore : TaskStore
    @State var modelIsPresented = false
    
    var body: some View {
        NavigationView {
            List{
//                ForEach(taskStore.tasks){ task in
//                    RowView(task: task)
//                }
                ForEach(taskStore.tasks){ index in
                    RowView(task: self.$taskStore.tasks[index])
                }
                .onMove{ sourceIndices , destinationIndex in
                    self.taskStore.tasks.move(fromOffsets: sourceIndices, toOffset: destinationIndex)
                }
                .onDelete{ indexSet in
                    self.taskStore.tasks.remove(atOffsets: indexSet)
                }
            }
        .navigationBarTitle("Tasks")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
            Button(action: {self.modelIsPresented = true}) {
                    Image(systemName: "plus")
                }
            )
        }
        .sheet(isPresented: $modelIsPresented) {
            NewTaskView(taskStore: self.taskStore)
        }
//        List(taskStore.tasks.indices) { index in
//            Text(self.taskStore.tasks[index].name)
//        }
//        List(taskStore.tasks, id: \.id){ task in
//            Text(task.name)
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(taskStore: TaskStore())
    }
}

