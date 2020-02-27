//
//  TaskDetailsViewController.swift
//  TODO-list
//
//  Created by Ivan Lutaenko on 3/18/19.
//  Copyright © 2019 Ivan Lutaenko. All rights reserved.
//

import UIKit

class TaskDetailsViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var ibTitle: UINavigationItem!
    
    var dataSource:[Task] = []{
        didSet{
            tableView.reloadSections(IndexSet(integer: 0), with: .none)
        }
    }
    var weekday: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ibTitle.title = weekday ?? ""
        setupTableView()
        setupDataSource()
    }
    
    //MARK: - Private methods
    private func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setupDataSource(){
        guard let day = weekday else { return }
        dataSource = DataManager.instance.getTasks(for: day)
    }

}


extension TaskDetailsViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as? TaskTableViewCell else {
            fatalError("Error: Cell doesn`t exist!")
        }
        let taskTitle = dataSource[indexPath.row].title
        cell.updateCell(title: taskTitle)
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let done = UITableViewRowAction(style: .destructive, title: "Done") { (action, indexPath) in
            DataManager.instance.deleteTask(task: self.dataSource[indexPath.row])
            self.setupDataSource()
        }
        done.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        return [done]
    }
    
    
}
