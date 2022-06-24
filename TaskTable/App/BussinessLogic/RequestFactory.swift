//
//  RequestFactory.swift
//  TaskTable
//
//  Created by Константин Каменчуков on 22.06.2022.
//

import Foundation
import Alamofire

class RequestFactory {
    
    func makeErrorParser() -> AbstractErrorParser {
        return ErrorParser()
    }
    
    lazy var commonSession: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let manager = Session(configuration: configuration)
        return manager
    }()
    
    let sessionQueue = DispatchQueue.global(qos: .utility)
    
    func makeLoginRequestFactory() -> LoginRequestFactory {
        let errorParser = makeErrorParser()
        return Login(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    func makeListRequestFactory() -> ListRequestFactory {
        let errorParser = makeErrorParser()
        return List(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    func makeTaskRequestFactory() -> TaskRequestFactory {
        let errorParser = makeErrorParser()
        return Task(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
}
