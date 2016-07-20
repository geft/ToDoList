//
//  ViewController.swift
//  ToDoList
//
//  Created by Gerry Juans on 7/14/16.
//  Copyright © 2016 Gerry Juans. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, DeleteDelegate {

    @IBOutlet weak var newTaskButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var toDoItems = [Task]()
    
    // MARK: New task
    
    @IBAction func newTaskAction(_ sender: AnyObject) {
        var inputTextField: UITextField?
        
        let alert = UIAlertController(title: "Add new task", message: nil, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: nil))
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: {(action) in
            let inputText = (inputTextField?.text)!
            
            if (!inputText.isEmpty) {
                self.appendItem(text: inputText)
            }
        }))
        alert.addTextField { (textField) in
            inputTextField = textField
        }
        
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: Table logic
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initTable()
        initToDoItems()
    }

    func initTable() {
        tableView.dataSource = self
        tableView.delegate = self
    }

    func initToDoItems() {
        if (toDoItems.count == 0) {
            appendItem(text: "Feed the cat")
            appendItem(text: "Clean the room")
        }
    }
    
    func appendItem(text: String) {
        toDoItems.append(Task(name: text))
        tableView.reloadData()
    }
    
    func deleteItem(index: Int) {
        if (toDoItems.count > 1) {
            toDoItems.remove(at: index)
        } else {
            toDoItems = [Task]()
        }
        
        tableView.deleteRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
    }
    
    func onDeleteCompleted(isDeleted: Boolean, index: Int) {
        if (isDeleted) {
            deleteItem(index: index)
        }
        
        tableView.reloadData()
    }
    
    // MARK: Table view
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        let cell: ToDoitem = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ToDoitem
        
        cell.delegate = self
        cell.label.text = toDoItems[index].name
        cell.deleteButton.tag = index
        
        if (toDoItems[index].isDone) {
            cell.strikeThroughItem(index: indexPath, text: toDoItems[index].name)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        
        if (toDoItems[index].isDone) {
            toDoItems[index].isDone = false
        } else {
            toDoItems[index].isDone = true
        }
        
        tableView.reloadData()
    }
    
    
}

