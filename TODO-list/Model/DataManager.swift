//
//  DataManager.swift
//  TODO-list
//
//  Created by Ivan Lutaenko on 3/18/19.
//  Copyright © 2019 Ivan Lutaenko. All rights reserved.
//

import Foundation

final class DataManager{
    static let instance = DataManager()
    
    private init(){
        generateWeekdays()
        generateTasks()
        generateTODOList()
    }
    
    private(set) var weekdays: [WeekDay] = []
    private(set) var tasks: [Task] = []
    private var todoList: [String:[Task]] = [:]
    
    
    //MARK: - Storage functions
    func deleteTask(task: Task){
        let weekday = task.weekday
        var tasks:[Task] = todoList[weekday] ?? []
        for exercise in tasks{
            if !tasks.isEmpty, exercise.id == task.id{
                guard let index = tasks.firstIndex(of: exercise) else { return }
                tasks.remove(at: index)
            }
        }
        todoList[weekday] = tasks
    }
    
    
    
    //MARK: - Private methods
    private func generateWeekdays(){
        weekdays.append(WeekDay(name: "Monday", icon: #imageLiteral(resourceName: "monday")))
        weekdays.append(WeekDay(name: "Tuesday", icon: #imageLiteral(resourceName: "tuesday")))
        weekdays.append(WeekDay(name: "Wednesday", icon: #imageLiteral(resourceName: "wednesday")))
        weekdays.append(WeekDay(name: "Thursday", icon: #imageLiteral(resourceName: "thursday")))
        weekdays.append(WeekDay(name: "Friday", icon: #imageLiteral(resourceName: "friday")))
        weekdays.append(WeekDay(name: "Saturday", icon: #imageLiteral(resourceName: "saturday")))
        weekdays.append(WeekDay(name: "Sunday", icon: #imageLiteral(resourceName: "sunday")))
    }
    
    private func generateTasks(){
        tasks.append(Task(title: "Training", details: "_________________", weekday: "Monday", id: 1))
        tasks.append(Task(title: "Clothes", details: "_________________", weekday: "Monday", id: 2))
        tasks.append(Task(title: "Lections", details: "_________________", weekday: "Monday", id: 3))
        tasks.append(Task(title: "Lections", details: "_________________", weekday: "Tuesday", id: 4))
        tasks.append(Task(title: "Game", details: "_________________", weekday: "Tuesday", id: 5))
    }
    
    private func generateTODOList(){
        for weekday in weekdays{
            todoList[weekday.name] = []
            for task in tasks{
                if weekday.name == task.weekday{
                    todoList[weekday.name]?.append(task)
                }
            }
        }
    }
    
    //MARK: - Public methods
    func getTasks(for day: String) -> [Task]{
        var tasksForDay: [Task] = []
        tasksForDay = todoList[day] ?? []
        return tasksForDay
    }
    
}
