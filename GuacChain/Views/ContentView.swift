//
//  ContentView.swift
//  GuacChain
//
//  Created by Eric on 11/05/2023.
//

import SwiftUI

struct ContentView: View {
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
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
