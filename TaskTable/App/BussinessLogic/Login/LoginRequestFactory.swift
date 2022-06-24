//
//  LoginRequestFactory.swift
//  TaskTable
//
//  Created by Константин Каменчуков on 22.06.2022.
//

import Foundation
import Alamofire

protocol LoginRequestFactory {
    func registration(username: String, password: String, completionHandler: @escaping (AFDataResponse<RegisterResult>) -> Void)
    
    func auth(username: String, password: String, completionHandler: @escaping (AFDataResponse<AuthResult>) -> Void)
}
