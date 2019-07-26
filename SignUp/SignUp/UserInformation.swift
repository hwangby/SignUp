//
//  UserInformation.swift
//  SignUp
//
//  Created by 황병윤 on 10/05/2019.
//  Copyright © 2019 HBY. All rights reserved.
//

import Foundation

class UserInformation {
    static let shared: UserInformation = UserInformation()
    
    var id: String?
    var newId: String?
    var password: String?
    var checkPw: String?
    var birthday: String?
    var comment: String?
}
