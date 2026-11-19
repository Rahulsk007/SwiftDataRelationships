//
//  TeacherModel.swift
//  SwiftDataRelationships
//
//  Created by Sk Sahabuddin on 19/11/26.
//

import SwiftData

@Model
final class TeacherModel {
    var name: String
    
    /*
        1. deleteRule: .cascade means deleting a teacher also deletes their associated students.
        2. inverse connects both sides of the relationship.
     */
    @Relationship(deleteRule: .cascade, inverse: \StudentModel.teacher)
    
    var students: [StudentModel] = []
    
    init(name: String) {
        self.name = name
    }
}
