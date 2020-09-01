//
//  Task.swift
//  TaskList
//
//  Created by Nitin Yadav on 01/09/20.
//  Copyright © 2020 Nitin. All rights reserved.
//
import Foundation

struct Task : Identifiable {
    let id = UUID()
    var name : String
    var completed = false
}
