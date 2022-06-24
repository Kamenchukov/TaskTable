//
//  ListRequestFactory.swift
//  TaskTable
//
//  Created by Константин Каменчуков on 22.06.2022.
//

import Foundation
import Alamofire

protocol ListRequestFactory {
    
    func createList(name: String, completionHandler: @escaping (AFDataResponse<CreateListResult>) -> Void)
    
    func updateList(name: String, completionHandler: @escaping (AFDataResponse<UpdateListResult>) -> Void)
    
    func lists( completionHandler: @escaping (AFDataResponse<ListsResult>) -> Void)
    
    func deleteList( completionHandler: @escaping (AFDataResponse<DeleteListResult>) -> Void)
    
}
