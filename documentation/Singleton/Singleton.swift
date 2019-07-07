//
//  Singleton.swift
//  documentation
//
//  Created by Ethan  on 5/7/19.
//  Copyright © 2019 Ethan . All rights reserved.
//

import Foundation

class Singleton {
    var text: String?
    
    static let singleton = Singleton()
    
    // get function for singleton
    func share() -> Singleton {
        return .singleton
    }
    
    // private init
    private init() {
        
    }
}
