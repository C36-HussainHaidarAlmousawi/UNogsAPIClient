//
//  File.swift
//  
//
//  Created by Brian Murphy on 13/03/2020.
//

import Foundation

extension Array: QueryComponent where Element == GenreResponse {
    var stringValue: String {
        self.flatMap { $0.identifiers }
            .map { "\($0)" }
            .joined(separator: ",")
    }
}
