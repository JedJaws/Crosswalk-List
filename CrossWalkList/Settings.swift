//
//  Settings.swift
//  CrossWalkList
//
//  Created by Paul Inventado on 3/21/22.
//

import SwiftUI

struct Settings: View {
    @AppStorage("sizeMultiplier") var sizeMultiplier = 1.0
    var body: some View {
        VStack {
            HStack {
                Text("Size multiplier")
                    .bold()
                Spacer()
            }.padding()
            HStack {
                Button(action: {
                    sizeMultiplier = 1
                }) {
                    Text("Small")
                        .modifier(ButtonDesign())
                }
                Button(action: {
                    sizeMultiplier = 1.3
                }) {
                    Text("Medium")
                        .modifier(ButtonDesign())
                }
                Button(action: {
                    sizeMultiplier = 1.5
                }) {
                    Text("Large")
                        .modifier(ButtonDesign())
                }
            }.padding()
            Spacer()
        }
        .font(.custom("Arial", size: CGFloat(18 * sizeMultiplier)))
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
