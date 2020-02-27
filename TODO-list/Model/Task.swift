//
//  Task.swift
//  TODO-list
//
//  Created by Ivan Lutaenko on 3/18/19.
//  Copyright © 2019 Ivan Lutaenko. All rights reserved.
//

import Foundation

struct Task {
    let title: String
    let details: String
    let weekday: String
    let id: Int
}

extension Task: Hashable, Equatable{
    
    static func ==(lhs: Task, rhs: Task) -> Bool{
        return lhs.id == rhs.id
    }
    
    var hashValue: Int{
        return self.id
    }
}
