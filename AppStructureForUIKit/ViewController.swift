//
//  ViewController.swift
//  AppStructureForUIKit
//
//  Created by Ebrahim abdelhamid on 25/03/2023.
//

import UIKit
import Combine

class ViewController: UIViewController, UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UsersTableViewCell
            
            let cellVM = viewModel.getCellViewModel( at: indexPath )
        print(cellVM.description)
            cell.userListCellViewModel = cellVM
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !viewModel.cellViewModels.isEmpty{
     return   viewModel.numberOfCells
        }else{
            return 0
        }
    }

    @IBOutlet weak var tableView: UITableView!
    lazy var viewModel: UsersListViewModel = {
        return UsersListViewModel()
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        initVM()
        initView()
    }
    func initView(){
     
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "UsersTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
      //  tableView.register(UsersTableViewCell.self, forCellReuseIdentifier: "cell")
    }
   
func initVM(){
    viewModel.$cellViewModels.sink{ [weak self] users in
        DispatchQueue.main.async {
            self?.tableView.reloadData()
        }
        print(users.count,"count")
               }
               .store(in: &viewModel.cancellables)
                
     viewModel.initFetch()
    }
}



