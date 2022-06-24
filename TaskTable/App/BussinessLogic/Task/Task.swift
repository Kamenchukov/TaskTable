//
//  Task.swift
//  TaskTable
//
//  Created by Константин Каменчуков on 22.06.2022.
//

import Foundation
import Alamofire

class Task: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = URL(string: "dev1.itpw.ru:8013/todo/")!

    
    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
            self.errorParser = errorParser
            self.sessionManager = sessionManager
            self.queue = queue
        }
}

extension Task: TaskRequestFactory {
    func createTask(todo_list: Int, name: String, completionHandler: @escaping (AFDataResponse<CreateTaskResult>) -> Void) {
        let requestModel = CreateTask(baseUrl: baseUrl, todo_list: todo_list, name: name)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func updateTask(todo_list: Int, name: String, completionHandler: @escaping (AFDataResponse<UpdateTaskResult>) -> Void) {
        let requestModel = UpdateTask(baseUrl: baseUrl, todo_list: todo_list, name: name)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func listOfTasks(todo_list: Int, completionHandler: @escaping (AFDataResponse<ListOfTasksResult>) -> Void) {
        let requestModel = ListOfTasks(baseUrl: baseUrl, todo_list: todo_list)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func deleteTask(completionHandler: @escaping (AFDataResponse<DeleteTaskResult>) -> Void) {
        let requestModel = DeleteTask(baseUrl: baseUrl)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func completeTask(completionHandler: @escaping (AFDataResponse<CompleteTaskResult>) -> Void) {
        let requestModel = CompleteTask(baseUrl: baseUrl)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
}

extension Task {
    
    struct CreateTask: RequestRouter {
        var baseUrl: URL
        var method: HTTPMethod = .post
        var path: String = "tasks/"
        
        let todo_list: Int
        let name: String
        var parameters: Parameters? {
            return [
                "todo_list": todo_list,
                "name": name
            ]
        }
    }
    
    struct UpdateTask: RequestRouter {
        var baseUrl: URL
        var method: HTTPMethod = .put
        var path: String = "<task_id>/"
        
        let todo_list: Int
        let name: String
        var parameters: Parameters? {
            return [
                "todo_list": todo_list,
                "name": name
            ]
        }
    }
    
    struct ListOfTasks: RequestRouter {
        var baseUrl: URL
        var method: HTTPMethod = .put
        var path: String = "tasks/"
        
        let todo_list: Int
        var parameters: Parameters? {
            return [
                "todo_list": todo_list
                ]
        }
    }
    
    struct DeleteTask: RequestRouter {
        var baseUrl: URL
        var method: HTTPMethod = .delete
        var path: String = "<task_id>/"
        
        var parameters: Parameters?
    }
    
    struct CompleteTask: RequestRouter {
        var baseUrl: URL
        var method: HTTPMethod = .post
        var path: String = "<task_id>/"
        
        var parameters: Parameters? 
    }
}
