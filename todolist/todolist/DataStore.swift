//
//  DataStore.swift
//  todolist
//
//  Created by Jimin Huh on 10/17/20.
//  Copyright © 2020 Jimin Huh. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

struct Task: Identifiable {
    var id = String()
    var toDoItem = String()
}

class TaskStore: ObservableObject {
    @Published var tasks = [Task]()
}
