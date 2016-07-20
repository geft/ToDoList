//
//  File.swift
//  ToDoList
//
//  Created by Gerry Juans on 7/20/16.
//  Copyright © 2016 Gerry Juans. All rights reserved.
//

import Foundation

class Task {
    var name: String
    var isDone: Bool
    
    init(name: String) {
        self.name = name
        self.isDone = false
    }
}
