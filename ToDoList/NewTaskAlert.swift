//
//  NewTaskAlert.swift
//  ToDoList
//
//  Created by Gerry Juans on 7/18/16.
//  Copyright © 2016 Gerry Juans. All rights reserved.
//

import Foundation
import UIKit

class NewTaskAlert {
    private var alert: UIAlertController
    
    init( items: inout [String], tableView: UITableView) {
        var inputTextField: UITextField?
    
        alert = UIAlertController(title: "Add new task", message: nil, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: nil))
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: {(action) in
            let inputText: String = (inputTextField?.text)!
            
            if (!inputText.isEmpty) {
                items.append(inputText)
                tableView.reloadData()
            }
        }))
        alert.addTextField { (textField) in
            inputTextField = textField
        }
    }
    
    func getAlert() -> UIAlertController {
        return alert
    }
}
