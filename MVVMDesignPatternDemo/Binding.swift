//
//  Binder.swift
//  MVVMDesignPatternDemo
//
//  Created by Eric Ho on 29/09/18.
//  Copyright © 2018 LomoStudio. All rights reserved.
//

import Foundation

class Observer<T> {
    
    // define a bind property as a closure
    var bind: (T) -> () = {_ in}
    
    init(value: T) {
        self.value = value
    }
    
    // if the value changed, let us do something!
    var value: T {
        didSet {
            bind(value)
        }
    }
    
}
