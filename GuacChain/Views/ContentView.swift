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
            titleView
            Spacer()
            qtySelectionView
            Spacer()
            pickerView
            totalView
            Spacer()
        }
        .task {
            await currencyVM.getData()
        }
    }
}

extension ContentView {
    private var titleView: some View {
        Group {
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
        }
    }
    
    private var qtySelectionView: some View {
        VStack(alignment: .leading) {
            QtySelectionView(qty: $currencyVM.tacoQty, menuString: "The Satoshi 'Taco' Moto")
            QtySelectionView(qty: $currencyVM.burritoQty, menuString: "Bitcoin Burrito")
            QtySelectionView(qty: $currencyVM.chipsQty, menuString: "Crypto Chips")
            QtySelectionView(qty: $currencyVM.horchataQty, menuString: "'No Bubble' Horchata'")
        }
    }
    
    private var pickerView: some View {
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
    }
    
    private var totalView: some View {
        HStack(alignment: .top) {
            Text("Total:")
                .font(.title)
            
            VStack(alignment: .leading) {
                Text("₿ \(currencyVM.calcBillInBitcoin(usdTotal: currencyVM.calcBill()))")
                Text("\(currencyVM.symbol)\(String(format: "%.2f", currencyVM.calcBillInCurrency(usdTotal: currencyVM.calcBill()))) ")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
