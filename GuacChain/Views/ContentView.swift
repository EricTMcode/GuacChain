//
//  ContentView.swift
//  GuacChain
//
//  Created by Eric on 11/05/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var currencyVM = CurrencyViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Text("Guac")
                    .foregroundColor(.green)
                Text("Chain")
                    .foregroundColor(.red)
            }
            .font(Font.custom("Marker Felt", size: 48))
            .bold()
            .lineLimit(1)
            .minimumScaleFactor(0.5)
            
            Text("The World's Tastiest Tacos - But We Only Accept Bitcoin")
                .font(Font.custom("Papyrus", size: 20))
                .multilineTextAlignment(.center)
                .padding(.bottom, 1)
            Text("🌮")
                .font(.system(size: 70))
            
            Spacer()
            
            VStack(alignment: .leading) {
                QtySelectionView(qty: $currencyVM.tacoQty, menuString: "The Satoshi 'Taco' Moto")
                QtySelectionView(qty: $currencyVM.burritoQty, menuString: "Bitcoin Burrito")
                QtySelectionView(qty: $currencyVM.chipsQty, menuString: "Crypto Chips")
                QtySelectionView(qty: $currencyVM.horchataQty, menuString: "'No Bubble' Horchata'")
            }
            
            Spacer()
            
            Picker("", selection: $currencyVM.currencySelection) {
                ForEach(Currency.allCases, id: \.self) { currency in
                    Text(currency.rawValue)
                }
            }
            .pickerStyle(.segmented)
            .padding()
            .onChange(of: currencyVM.currencySelection) { _ in
                currencyVM.symbol = "\(currencyVM.currencySelection.rawValue.prefix(1))"
                print(currencyVM.symbol)
            }
            
            HStack(alignment: .top) {
                Text("Total:")
                    .font(.title)
                
                VStack(alignment: .leading) {
                    Text("₿ \(currencyVM.calcBillInBitcoin(usdTotal: currencyVM.calcBill()))")
                    Text("\(currencyVM.symbol)\(String(format: "%.2f", currencyVM.calcBillInCurrency(usdTotal: currencyVM.calcBill()))) ")
                }
            }
            
            Spacer()
        }
        .task {
            await currencyVM.getData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
