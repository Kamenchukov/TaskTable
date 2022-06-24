//
//  TaskRequestFactory.swift
//  TaskTable
//
//  Created by Константин Каменчуков on 22.06.2022.
//

import Foundation
import Alamofire

protocol TaskRequestFactory {
    
    func createTask(todo_list: Int, name: String, completionHandler: @escaping (AFDataResponse<CreateTaskResult>) -> Void)
    
    func updateTask(todo_list: Int, name: String, completionHandler: @escaping (AFDataResponse<UpdateTaskResult>) -> Void)
    
    func listOfTasks(todo_list: Int, completionHandler: @escaping (AFDataResponse<ListOfTasksResult>) -> Void)
    
    func deleteTask( completionHandler: @escaping (AFDataResponse<DeleteTaskResult>) -> Void)
    
    func completeTask( completionHandler: @escaping (AFDataResponse<CompleteTaskResult>) -> Void)
}
