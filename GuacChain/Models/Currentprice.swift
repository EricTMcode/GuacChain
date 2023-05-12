//
//  Currentprice.swift
//  GuacChain
//
//  Created by Eric on 12/05/2023.
//

import Foundation

struct Currentprice: Codable {
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
