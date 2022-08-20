//
//  IntExtension.swift
//  SwiftFirebaseExample
//
//  Created by Mustafa Ali DİKÇINAR on 20.08.2022.
//

import Foundation

extension Int {
    
    func getCategoryName() -> String {
        switch self {
        case 0:
             return "News"
        case 1:
            return "Sports"
        default:
            return "Other"
        }
    }
}
