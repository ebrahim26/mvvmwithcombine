//
//  UsersTableViewCell.swift
//  AppStructureForUIKit
//
//  Created by Ebrahim abdelhamid on 25/03/2023.
//

import UIKit

class UsersTableViewCell: UITableViewCell {

    @IBOutlet weak var titleName: UILabel!
    
    @IBOutlet weak var idName: UILabel!
    var userListCellViewModel : UserListCellViewModel? {
           didSet {
              idName.text = userListCellViewModel?.id
           titleName.text = userListCellViewModel?.description
             
           }
    }
}
