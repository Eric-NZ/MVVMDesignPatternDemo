//
//  ViewModel.swift
//  MVVMDesignPatternDemo
//
//  Created by Eric Ho on 29/09/18.
//  Copyright © 2018 LomoStudio. All rights reserved.
//

import Foundation

class ViewModel {
    
    // assign model variable a observable Model<Data>
    // without Observable: private var model = Model<Date>()
    private var model = Model<Observable<Date>>()
    
    // amount of items
    var count: Int {
        return model.count
    }
    
    // add an item
    func addEntry () {
        // create an observalbe Date
        let observableDate = Observable(Date())
        
        // set up bind for observableDate
        observableDate.bind = { _ in
            // post notification
            NotificationCenter.default.post(name: Notification.Name(rawValue: "updateUI"), object: nil)
        }
        
        // dispatach a date update
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(3)) {
            observableDate.value = Date()
            
            print("Date changed!")
        }
        
        // insert an obserable date
        // without Obserable: model.insert(Date())
        model.insert(observableDate)
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
        
        return date.value.description
    }
}

