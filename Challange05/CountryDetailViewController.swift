//
//  CountryDetailViewController.swift
//  Challange05
//
//  Created by teddy on 2022-09-15.
//

import UIKit

class CountryDetailViewController: UITableViewController {

    var name: String?
    var captial: String?
    var population: String?
    var size: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = name
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var configuration = cell.defaultContentConfiguration()
        switch indexPath.row {
        case 1:
            configuration.text = self.population ?? ""
        case 2:
            configuration.text = self.size ?? ""
        default:
            configuration.text = self.captial ?? ""
        }
        cell.contentConfiguration = configuration
        return cell
    }
    
    @objc func shareTapped() {
        print("SHARING IS CARING")
        let vc = UIActivityViewController(activityItems: ["Here's some fun fact about \(self.name!)", "Capital: \(self.captial!), Population: \(self.population!), Size: \(self.size!)"], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
}
