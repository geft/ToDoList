//
//  ToDoitem.swift
//  ToDoList
//
//  Created by Gerry Juans on 7/18/16.
//  Copyright © 2016 Gerry Juans. All rights reserved.
//

import UIKit

protocol DeleteDelegate: class {
    func onDeleteCompleted(isDeleted: Boolean, index: Int)
}

class ToDoitem: UITableViewCell {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    
    weak var delegate: DeleteDelegate?
    
    @IBAction func deleteAction(_ sender: AnyObject) {
        let label = deleteButton.currentTitle
        var isDeleted = false
        
        if (label == "Delete") {
            deleteButton.setTitle("Confirm?", for: [])
        } else {
            deleteButton.setTitle("Delete", for: [])
            isDeleted = true
        }
        
        delegate?.onDeleteCompleted(isDeleted: isDeleted, index: sender.tag)
    }
    
    func strikeThroughItem(index: IndexPath, text: String) {
        label.attributedText = getStyledText(text: text)
    }
    
    func getStyledText(text: String) -> NSMutableAttributedString {
        let attributeString = NSMutableAttributedString(string: text)
        attributeString.addAttribute(
            NSStrikethroughStyleAttributeName, value: 2, range: NSMakeRange(0, attributeString.length))
        
        return attributeString
    }

}
