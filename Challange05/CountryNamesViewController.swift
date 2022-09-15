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
        
        if let fileUrl = loadCountriesJson(),
           let data = try? Data(contentsOf: fileUrl) {
            countries = parse(data)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Countries"
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = CountryDetailViewController()
        let country = countries[indexPath.row]
        vc.name = country.name
        vc.captial = country.capital
        vc.size = country.size
        vc.population = country.population
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension CountryNamesViewController {
    // Get the 'countries.json' file path
    func loadCountriesJson() -> URL? {
        if let filePath = Bundle.main.path(forResource: "countryNames", ofType: "json") {
            return URL(fileURLWithPath: filePath)
        }
        return nil
    }
    
    func parse(_ data: Data) -> [Country] {
            do {
                let jsonData = try JSONDecoder().decode(Countries.self, from: data)
                return jsonData.results
            } catch {
                print("Could not load json data")
                print(error)
            }
        return [Country]()
    }
}
