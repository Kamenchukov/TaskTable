//
//  Login.swift
//  TaskTable
//
//  Created by Константин Каменчуков on 22.06.2022.
//

import Foundation
import Alamofire

class Login: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = URL(string: "http://dev1.itpw.ru:8013/accounts/authentication/")!

    
    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
            self.errorParser = errorParser
            self.sessionManager = sessionManager
            self.queue = queue
        }
}

extension Login: LoginRequestFactory {
    func registration(username: String, password: String, completionHandler: @escaping (AFDataResponse<RegisterResult>) -> Void) {
        let requestModel = Registration(baseUrl: baseUrl, username: username, password: password)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func auth(username: String, password: String, completionHandler: @escaping (AFDataResponse<AuthResult>) -> Void) {
        let requestModel = Auth(baseUrl: baseUrl, username: username, password: password)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
}

extension Login {
    
    struct Registration: RequestRouter {
        var baseUrl: URL
        var method: HTTPMethod = .post
        var path: String = "reg/"
        
        let username: String
        let password: String
        var parameters: Parameters? {
            return [
                "username": username,
                "password": password
            ]
        }
    }
    
    struct Auth: RequestRouter {
        var baseUrl: URL
        var method: HTTPMethod = .post
        var path: String = "auth/"
        
        let username: String
        let password: String
        var parameters: Parameters? {
            return [
                "username": username,
                "password": password
            ]
        }
    }
}
