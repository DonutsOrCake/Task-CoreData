//
//  TaskController.swift
//  Task-CoreData
//
//  Created by Bryson Jones on 4/27/21.
//

import CoreData


class TaskController {
    
    //MARK: - Properties
    static let sharedInstance = TaskController()
    var tasks: [Task] = []
    
    private lazy var fetchRequest: NSFetchRequest<Task> = {
        let request = NSFetchRequest<Task>(entityName: "Task")
        request.predicate = NSPredicate(value: true)
        return request
    }()
    
    private init() {}
    
    //MARK: - CRUD
    func createTaskWith(name: String, notes: String?, dueDate: Date?) {
        let newTask = Task(name: name, notes: notes ?? "", dueDate: dueDate ?? Date())
        tasks.append(newTask)
        
        CoreDataStack.saveContext()
    }
    
    func fetchTasks() {
        let tasks = (try? CoreDataStack.context.fetch(self.fetchRequest)) ?? []
        self.tasks = tasks
    }
    
    func updateTask(task: Task, name: String, notes: String?, dueDate: Date?) {
        task.name = name
        task.notes = notes
        task.dueDate = dueDate
        
        CoreDataStack.saveContext()
    }
    
    func deleteTask(task: Task) {
        guard let taskToDelete = tasks.firstIndex(of: task) else {return}
            tasks.remove(at: taskToDelete)
        CoreDataStack.context.delete(task)
        CoreDataStack.saveContext()
    }
    
    func toggleIsComplete(task: Task) {
        task.isComplete.toggle()
        CoreDataStack.saveContext()
    }
}//End of class
