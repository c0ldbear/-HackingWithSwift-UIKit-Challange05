//
//  Country.swift
//  Challange05
//
//  Created by teddy on 2022-09-15.
//

import Foundation

struct Country: Codable {
    var name: String
    var capital: String?
    var population: String?
    var currency: String?
    var size: String?
}

struct Countries: Codable {
    var results: [Country]
}
