//
//  ContentView.swift
//  DynamicListSwiftUI
//
//  Created by Marquis Dennis on 6/12/19.
//  Copyright © 2019 Marquis Dennis. All rights reserved.
//

import SwiftUI

// user model
struct User: Identifiable {
    let id: Int
    let username: String
    let message: String
    let imageName: String
}

extension User {
    static var userList: [User] {
        let longMessage = """
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                            """
        return [
            User(id: 100, username: "Tim Cook", message: "My nice shiny new monitor stand is $999!!!", imageName: "cook"),
            User(id: 101, username: "Craig Federighi", message: "I will buy that stand from you man!", imageName: "craig"),
            User(id: 102, username: "John Ivey", message: longMessage, imageName: "ivey")
        ]
    }
}

struct UserRow: View {
    let user: User
    
    var body: some View {
        HStack {
            Image(user.imageName)
                .resizable()
                .clipShape(Circle())
                .frame(width: 70, height: 70, alignment: .leading)
                .overlay(Circle().stroke(Color.gray, lineWidth: 4))
            VStack(alignment: .leading) {
                Text(user.username)
                    .font(.headline)
                Text(user.message)
                    .font(.subheadline)
                    .lineLimit(nil)
                }.padding(.leading, 8)
            }.padding(.init(top: 12, leading: 0, bottom: 12, trailing: 0))
    }
}

struct ContentView : View {
    let users: [User] = User.userList
    
    var body: some View {
        NavigationView {
            List {
                Text("Users").font(.title)
                ForEach(users.identified(by: \.id)) { user in
                    UserRow(user: user)
                }
            }.navigationBarTitle(Text("Dynamic List"))
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
