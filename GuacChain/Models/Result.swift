//
//  Currentprice.swift
//  GuacChain
//
//  Created by Eric on 12/05/2023.
//

import Foundation

enum Currency: String, CaseIterable {
    case usd = "$ USD"
    case gbp = "£ GBP"
    case eur = "€ EUR"
}

enum Price: Double {
    case taco = 5.00
    case burrito = 8.00
    case chips = 3.00
    case horchata = 2.00
}


struct Result: Codable {
    var bpi: Bpi
}

struct Bpi: Codable {
    var USD: Usd
    var GBP: Gbp
    var EUR: Eur
}

struct Usd: Codable {
    var rateFloat: Double
    
    enum CodingKeys: String, CodingKey {
        case rateFloat = "rate_float"
    }
}

struct Gbp: Codable {
    var rateFloat: Double
    
    enum CodingKeys: String, CodingKey {
        case rateFloat = "rate_float"
    }
}

struct Eur: Codable {
    var rateFloat: Double
    
    enum CodingKeys: String, CodingKey {
        case rateFloat = "rate_float"
    }
}
