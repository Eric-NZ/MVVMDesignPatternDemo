//
//  ViewModel.swift
//  MVVMDesignPatternDemo
//
//  Created by Eric Ho on 29/09/18.
//  Copyright © 2018 LomoStudio. All rights reserved.
//

import Foundation

class ViewModel {
    
    private var model = Model<Date>()
    
    // amount of items
    var count: Int {
        return model.count
    }
    
    // add an item
    func addEntry () {
        model.insert(Date())
    }
    
    // remove an item
    func removeEntry(index: Int) {
        model.remove(at: index)
    }
    
    // access element
    subscript(index: Int) -> String? {
        guard let date = model[index] else {
            return nil
        }
        
        return date.description
    }
}
