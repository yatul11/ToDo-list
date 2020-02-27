//
//  WeekdaysViewController.swift
//  TODO-list
//
//  Created by Ivan Lutaenko on 3/18/19.
//  Copyright © 2019 Ivan Lutaenko. All rights reserved.
//

import UIKit

class WeekdaysViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    private let dataSource: [WeekDay] = DataManager.instance.weekdays
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destVC = segue.destination as? TaskDetailsViewController, segue.identifier == "showTaskDetails"{
            guard let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) else { return }
            let weekday = dataSource[indexPath.row].name
            destVC.weekday = weekday
        }
    }
    
    //MARK: - Private methods
    private func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension WeekdaysViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "weekdayCell", for: indexPath) as? WeekdayTableViewCell else {
            fatalError("Error: Cell doesn`t exist!")
        }
        cell.update(image: dataSource[indexPath.row].icon, name: dataSource[indexPath.row].name)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
}
