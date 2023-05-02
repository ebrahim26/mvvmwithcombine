//
//  UserModel.swift
//  AppStructureForUIKit
//
//  Created by Ebrahim abdelhamid on 25/03/2023.
//

import Foundation

// MARK: - WelcomeElement
struct Users: Codable {
    let userID, id: Int
    let title: String
    let completed: Bool

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, completed
    }
}
struct UserListCellViewModel {
    var id: String
    var description: String
  
}
