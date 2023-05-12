//
//  CurrencyViewModel.swift
//  GuacChain
//
//  Created by Eric on 12/05/2023.
//

import Foundation

@MainActor
class CurrencyViewModel: ObservableObject {
    @Published var usdPerBTC: Double = 0.00
    @Published var gbpPerBTC: Double = 0.00
    @Published var eurPerBTC: Double = 0.00
    
    var urlString = "https://api.coindesk.com/v1/bpi/currentprice.json"
    
    func getData() async {
        print("🕸️ We are accessing the url \(urlString)")
        guard let url = URL(string: urlString) else {
            print("😡 ERROR: Could not create a URL from \(urlString)")
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            guard let currentprice = try? JSONDecoder().decode(Currentprice.self, from: data) else {
                print("😡 JSON ERROR: Could not decode returned JSON data")
                return
            }
            self.usdPerBTC = currentprice.bpi.USD.rateFloat
        } catch {
            print("😡 ERROR: Could not use URL at \(urlString) to get data and response")
        }
    }
}
