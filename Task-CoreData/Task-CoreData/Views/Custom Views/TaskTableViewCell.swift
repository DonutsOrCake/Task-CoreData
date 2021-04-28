//
//  TaskTableViewCell.swift
//  Task-CoreData
//
//  Created by Bryson Jones on 4/27/21.
//

import UIKit

protocol TaskCellDelegate: AnyObject {
    func taskCellButtonTapped(_ sender: TaskTableViewCell)
}

class TaskTableViewCell: UITableViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var completionButton: UIButton!
    @IBOutlet weak var dueDateLabel: UILabel!
    
    //MARK: - Properties
    weak var delegate: TaskCellDelegate?
    var task: Task? {
        didSet {
            updateViews()
        }
    }
    
    //MARK: - Actions
    @IBAction func completionButtonTapped(_ sender: Any) {
        delegate?.taskCellButtonTapped(self)
    }
    
    //MARK: - Functions
    func updateViews() {
        guard let task = task else {return}
        taskNameLabel.text = task.name
        if task.isComplete {
            completionButton.setImage(#imageLiteral(resourceName: "complete"), for: .normal)
        } else {
            completionButton.setImage(#imageLiteral(resourceName: "incomplete"), for: .normal)
        }
    }
}//End of class
