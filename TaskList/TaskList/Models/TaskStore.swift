//
//  TaskStore.swift
//  TaskList
//
//  Created by Nitin Yadav on 01/09/20.
//  Copyright © 2020 Nitin. All rights reserved.
//

import Combine

class TaskStore : ObservableObject {
    @Published var tasks = [
        "1st task",
        "2nd task",
        "3rd task",
        "4th task"
        ].map { Task(name : $0) } 
}
