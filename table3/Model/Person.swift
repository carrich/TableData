//
//  Person.swift
//  table3
//
//  Created by Ngoduc on 5/22/20.
//  Copyright © 2020 Ngoduc. All rights reserved.
//

import Foundation
struct Person {
    var name: String
    var phone: String
    var avatarName: String
    
}
func fakeData() -> [Person]{
    let  person1 = Person.init(name: "Đức", phone: "123", avatarName: "1")
    let  person2 = Person.init(name: "Đức1", phone: "123", avatarName: "2")
    return [person1,person2]
}
