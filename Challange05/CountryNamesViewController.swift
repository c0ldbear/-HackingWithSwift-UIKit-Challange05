//
//  ViewController.swift
//  Challange05
//
//  Created by teddy on 2022-09-15.
//

import UIKit

class CountryNamesViewController: UITableViewController {
    
    var countries = [Country]()
    
    override func loadView() {
        super.loadView()
        
        if let fileUrl = filePathCountriesJson(),
           let data = try? Data(contentsOf: fileUrl) {
            print(data)
            do {
                let jsonData = try JSONDecoder().decode(Countries.self, from: data)
                print(jsonData)
                countries = jsonData.results
            } catch {
                print("Could not load json data")
                print(error)
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.isEmpty ? 2 : countries.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Country")!
        var configuration = cell.defaultContentConfiguration()
        configuration.text = countries[indexPath.row].name
        cell.contentConfiguration = configuration
        return cell
    }
    
}

extension CountryNamesViewController {
    // Get the 'countries.json' file path
    func filePathCountriesJson() -> URL? {
        if let filePath = Bundle.main.path(forResource: "countryNames", ofType: "json") {
            return URL(fileURLWithPath: filePath)
        }
        return nil
    }
}
