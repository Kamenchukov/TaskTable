//
//  List.swift
//  TaskTable
//
//  Created by Константин Каменчуков on 22.06.2022.
//

import Foundation
import Alamofire

class List: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = URL(string: "http://dev1.itpw.ru:8013/todo/lists/")!

    
    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
            self.errorParser = errorParser
            self.sessionManager = sessionManager
            self.queue = queue
        }
}

extension List: ListRequestFactory {
    func createList(name: String, completionHandler: @escaping (AFDataResponse<CreateListResult>) -> Void) {
        let requestModel = CreateList(baseUrl: baseUrl, name: name)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func updateList(name: String, completionHandler: @escaping (AFDataResponse<UpdateListResult>) -> Void) {
        let requestModel = UpdateList(baseUrl: baseUrl, name: name)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func lists(completionHandler: @escaping (AFDataResponse<ListsResult>) -> Void) {
        let requestModel = List(baseUrl: baseUrl)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func deleteList(completionHandler: @escaping (AFDataResponse<DeleteListResult>) -> Void) {
        let requestModel = DeleteList(baseUrl: baseUrl)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    
}

extension List {
    
    struct CreateList: RequestRouter {
        var baseUrl: URL
        var method: HTTPMethod = .post
        var path: String = "lists/"
        
        let name: String
        var parameters: Parameters? {
            return [
                "name": name
            ]
        }
    }
        
        struct UpdateList: RequestRouter {
            var baseUrl: URL
            var method: HTTPMethod = .put
            var path: String = "lists/"
            
            let name: String
            var parameters: Parameters? {
                return [
                    "name": name
                ]
            }
        }
            
            struct List: RequestRouter {
                var baseUrl: URL
                var method: HTTPMethod = .get
                var path: String = "lists/"
                
                var parameters: Parameters?
                
            }
            
            struct DeleteList: RequestRouter {
                var baseUrl: URL
                var method: HTTPMethod = .delete
                var path: String = "lists/"
                
                var parameters: Parameters?
                
            }
}
