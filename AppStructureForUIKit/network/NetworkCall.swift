//
//  NetworkCall.swift
//  AppStructureForUIKit
//
//  Created by Ebrahim abdelhamid on 25/03/2023.
//

import Foundation
import Alamofire
public class APIService  : APIServiceProtocol {
    
     func getUsers(cb : @escaping ([Users]?,Error?) -> () ){
    
        let url = URL(string: "https://jsonplaceholder.typicode.com/todos")
        AF.request(url! , method: .get, headers: nil ).responseJSON { (response) in

            let result = response.data
            do {
                let decoder = JSONDecoder()

                do {
                    let decoded = try decoder.decode([Users].self, from: result!)
                    print(decoded.count)
                   
                    if response.response?.statusCode == 200 {
                        cb( decoded, nil )
                    }else {
                        cb( [],response.error)
                    }
                } catch {
                    print("Failed to decode JSON")
                }

            }catch {
             //   UIViewController.removeSpinner(spinner: sv)
                print("error")
                 cb( []  , response.error)
            }

        }
    }
}
protocol APIServiceProtocol {
    func  getUsers(cb : @escaping ([Users]?,Error?) -> () )
}
