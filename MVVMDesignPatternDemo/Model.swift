//
//  Model.swift
//  MVVMDesignPatternDemo
//
//  Created by Eric Ho on 29/09/18.
//  Copyright © 2018 LomoStudio. All rights reserved.
//

import Foundation

struct Model<T> {
    
    private var objects = [T]()
    
    // get amount of the objects
    var count: Int {
        return objects.count
    }
    
    // must be mutable because we will be changing the objects.
    mutating func insert(_ object: T) {
        self.objects.insert(object, at: 0)
    }
    
    mutating func remove(at index: Int) {
        guard objects.indices.contains(index) else {
            return
        }
        objects.remove(at: index)
    }
    
    // subscript can be used to get and set, silimar to KVO in Objective-C
    subscript(index: Int) -> T? {
        guard index >= 0 else {
            return nil
        }
        return objects.indices.contains(index) ? objects[index] : nil
    }
}
