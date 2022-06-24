//
//  extancions.swift
//  TaskTable
//
//  Created by Константин Каменчуков on 24.06.2022.
//

import Foundation

extension TableViewController {
    
    
    func CreateTaskRequest() {
        let createTask = requestFactory.makeTaskRequestFactory()
        
        createTask
            .createTask(todo_list: todoList, name: name) { response in
                switch response.result {
                case .success(let result):
                    print(result)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
    
    func UpdateTaskRequest() {
        let updateTask = requestFactory.makeTaskRequestFactory()
        
        updateTask
            .createTask(todo_list: todoList, name: name) { response in
                switch response.result {
                case .success(let result):
                    print(result)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
    
    func ListOfTasksRequest() {
        let listOfTask = requestFactory.makeTaskRequestFactory()
        
        listOfTask
            .listOfTasks(todo_list: todoList) { response in
                switch response.result {
                case .success(let result):
                    print(result)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
    
    func DeleteTaskRequest() {
        let deleteTask = requestFactory.makeTaskRequestFactory()
        
        deleteTask
            .deleteTask { response in
                switch response.result {
                case .success(let result):
                    print(result)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
    
    func CompleteTaskRequest() {
        let completeTask = requestFactory.makeTaskRequestFactory()
        
        completeTask
            .completeTask { response in
                switch response.result {
                case .success(let result):
                    print(result)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
    
    func CreateList() {
        let createList = requestFactory.makeListRequestFactory()
        
        createList
            .createList(name: name) { response in
                switch response.result {
                case .success(let result):
                    print(result)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
    
    func UpdateList() {
        let updateList = requestFactory.makeListRequestFactory()
        
        updateList
            .updateList(name: name) { response in
                switch response.result {
                case .success(let result):
                    print(result)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
    
    func ListRequest() {
        let list = requestFactory.makeListRequestFactory()
        
        list
            .lists { response in
                switch response.result {
                case .success(let result):
                    print(result)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
    
    func DeleteListRequest() {
        let deleteList = requestFactory.makeListRequestFactory()
        
        deleteList
            .deleteList { response in
                switch response.result {
                case .success(let result):
                    print(result)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
}
