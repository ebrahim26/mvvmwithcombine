//
//  userViewModel.swift
//  AppStructureForUIKit
//
//  Created by Ebrahim abdelhamid on 25/03/2023.
//

import Foundation
import Combine
class UsersListViewModel {
    
    let apiService: APIServiceProtocol

    private var users: [Users] = [Users]()
    
    var cancellables = Set<AnyCancellable>()
        
    @Published var cellViewModels: [UserListCellViewModel] = [UserListCellViewModel]()
    
    var numberOfCells: Int {
        return cellViewModels.count
    }
    
    var isAllowSegue: Bool = false
    
    var user: Users?

//    var reloadTableViewClosure: (()->())?
//    var showAlertClosure: (()->())?
//    var updateLoadingStatus: (()->())?

    init( apiService: APIServiceProtocol = APIService()) {
        self.apiService = apiService
    }
    
    func initFetch() {
      //  state = .loading
        apiService.getUsers { [weak self] (users, error) in
            guard let self = self else {
                return
            }

            guard error == nil else {
              //  self.state = .error
             //   self.alertMessage = error?.rawValue
                return
            }

            self.processFetchedPhoto(users: users!)
           // self.state = .populated
        }
    }
    
    func getCellViewModel( at indexPath: IndexPath ) -> UserListCellViewModel {
        return cellViewModels[indexPath.row]
    }
    
    func createCellViewModel( users: Users ) -> UserListCellViewModel {

        return UserListCellViewModel(id: "\(users.id)", description: users.title)
    }
    
    private func processFetchedPhoto( users: [Users] ) {
        self.users = users // Cache
        var vms = [UserListCellViewModel]()
        for users in users {
            vms.append( createCellViewModel(users: users) )
        }
        self.cellViewModels = vms
    }
    
}
