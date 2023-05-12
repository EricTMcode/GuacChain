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
            guard let result = try? JSONDecoder().decode(Result.self, from: data) else {
                print("😡 JSON ERROR: Could not decode returned JSON data")
                return
            }
            self.usdPerBTC = result.bpi.USD.rateFloat
            self.gbpPerBTC = result.bpi.GBP.rateFloat
            self.eurPerBTC = result.bpi.EUR.rateFloat
            print("One bitcoin is currently worth: $\(usdPerBTC), £\(gbpPerBTC), €\(eurPerBTC)  ")
        } catch {
            print("😡 ERROR: Could not use URL at \(urlString) to get data and response")
        }
    }
}
