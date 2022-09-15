//
//  Country.swift
//  Challange05
//
//  Created by teddy on 2022-09-15.
//

import Foundation

struct Country: Codable {
    var name: String
    var info: [CountryInfo]
}

struct CountryInfo: Codable {
    var capital: String
    var size: String
    var population: String
    var currency: String
}
