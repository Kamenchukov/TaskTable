//
//  UpdateTaskResult.swift
//  TaskTable
//
//  Created by Константин Каменчуков on 22.06.2022.
//

import Foundation

struct UpdateTaskResult: Codable {
    let id: Int
    let _todo_list: String
    let completed: Bool
    let name: String
    let todo_list: Int
}
