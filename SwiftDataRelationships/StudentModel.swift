//
//  StudentModel.swift
//  SwiftDataRelationships
//
//  Created by Sk Sahabuddin on 19/11/26.
//

import SwiftData

@Model
final class StudentModel {
    var name : String
    var age : Int
    
    var teacher: TeacherModel?
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}
