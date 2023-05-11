//
//  ContentView.swift
//  GuacChain
//
//  Created by Eric on 11/05/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var qty = 0
    
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
            
            Text("🌮")
                .font(.system(size: 70))
            
            HStack {
                Text("\(qty)")
                    .font(.system(size: 48))
                    .fontWeight(.heavy)
                .frame(width: 70)
                VStack(alignment: .leading) {
                    Text("The Satoshi 'Taco' moto")
                        .font(.title2)
                    
                    Stepper("", value: $qty)
                        .labelsHidden()
                }
               
            }
            
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
