//
//  StateView.swift
//  SwiftUI_iOS17
//
//  Created by don't touch me on 2/15/24.
//

import SwiftUI

struct StateView: View {
    
    @State private var count: Int = 0
    @State private var isOn: Bool = false
    
    var body: some View {
        VStack {
            
            Toggle(isOn: $isOn, label: {
                Text("Light Switch")
                    .font(.headline)
            })
            
            Text("\(count)")
                .font(.largeTitle)
            
            Button(isOn ? "ON" : "OFF") {
                count += 1
            }
        }
        .padding()
    }
}

#Preview {
    StateView()
}
