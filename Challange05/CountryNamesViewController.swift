//
//  ViewController.swift
//  Challange05
//
//  Created by teddy on 2022-09-15.
//

import UIKit

class CountryNamesViewController: UITableViewController {
    
    override func loadView() {
        super.loadView()
        // load file: countries.json
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Country")!
        var configuration = cell.defaultContentConfiguration()
        configuration.text = "Country #\(indexPath.row + 1)"
        cell.contentConfiguration = configuration
        return cell
    }
    
}

