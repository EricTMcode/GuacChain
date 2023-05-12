//
//  QtySelectionView.swift
//  GuacChain
//
//  Created by Eric on 11/05/2023.
//

import SwiftUI

struct QtySelectionView: View {
    @Binding var qty: Int
    var menuString: String
    
    var body: some View {
        HStack {
            Text("\(qty)")
                .font(.system(size: 48))
                .fontWeight(.heavy)
                .frame(width: 70)
            
            VStack(alignment: .leading, spacing: 0) {
                Text(menuString)
                    .font(.title2)
                
                Stepper("", value: $qty, in: 0...99)
                    .labelsHidden()
            }
        }
        .lineLimit(1)
        .minimumScaleFactor(0.5)
    }
}

struct QtySelectionView_Previews: PreviewProvider {
    static var previews: some View {
        QtySelectionView(qty: .constant(4), menuString: "The Satoshi 'Taco' Moto")
    }
}
