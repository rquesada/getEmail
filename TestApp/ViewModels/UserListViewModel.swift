//
//  UserListViewModel.swift
//  TestApp
//
//  Created by Roy Quesada on 28/3/23.
//

import Foundation

class UserListViewModel: ObservableObject {
    
    @Published var users = [UserViewModel]()
    let httpClient = HttpClient()
    
    func getUsers(){
        httpClient.getUsers(){ result in
            switch result{
            case .success(let users):
                if let users = users {
                    DispatchQueue.main.async {
                        self.users = users.map(UserViewModel.init)
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}


struct UserViewModel{
    let user: User
    
    var email:String {
        user.email
    }
}

