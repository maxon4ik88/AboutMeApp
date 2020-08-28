//
//  Authentication.swift
//  HW2.4
//
//  Created by Maxon on 28.08.2020.
//  Copyright © 2020 Maxim Shvanov. All rights reserved.
//

import Foundation

struct User {
    let login: String
    let password: String
    let name: String
}

let shvanov = User(login: "shvanov", password: "1qaz", name: "Maxim")
let admin = User(login: "admin", password: "admin11", name: "Alexey")

let users = ["shvanov" : shvanov, "admin" : admin]
