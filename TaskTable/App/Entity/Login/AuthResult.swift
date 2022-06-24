//
//  Auth.swift
//  TaskTable
//
//  Created by Константин Каменчуков on 22.06.2022.
//

import Foundation

struct AuthResult: Codable {
    let token: String
    let detail: String?
}
