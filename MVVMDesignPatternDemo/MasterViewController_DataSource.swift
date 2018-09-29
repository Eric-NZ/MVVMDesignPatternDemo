//
//  MasterViewController_DataSource.swift
//  MVVMDesignPatternDemo
//
//  Created by Eric Ho on 29/09/18.
//  Copyright © 2018 LomoStudio. All rights reserved.
//

import UIKit

extension MasterViewController {
    
    // MARK: - MasterViewController DataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // replace object.count with viewModel.count
        // NOTE: viewModel would not be accessable if it was declared as a private variable.
        return viewModel.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        // replace with a string value from viewModel's subscript function
        let object =  viewModel[indexPath.row]
        cell.textLabel!.text = object
        return cell
    }
}
