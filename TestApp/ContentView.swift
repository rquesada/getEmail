//
//  ContentView.swift
//  TestApp
//
//  Created by Roy Quesada on 28/3/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var userListVM: UserListViewModel
    
    init(){
        userListVM = UserListViewModel()
        userListVM.getUsers()
    }
    
    var body: some View {
        VStack{
            Text("Emails")
            List(userListVM.users , id:\.email){ user in
                Text("\(user.email)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
