//
//  UpdateListResult.swift
//  TaskTable
//
//  Created by Константин Каменчуков on 22.06.2022.
//

import Foundation

struct UpdateListResult: Codable {
    let id: Int
    let completed: Bool
    let completion_progress: Int
    let name: String
}
