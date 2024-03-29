//
//  BindableView.swift
//  SwiftUI_iOS17
//
//  Created by don't touch me on 2/15/24.
//

import SwiftUI
import SwiftData

@Observable
class Light{
    var isOn: Bool = false
}
struct Room: View {
    
    // child view can talk to parent view and change
    @Bindable var light: Light
    
    var body: some View {
        Toggle(isOn: $light.isOn) {
            EmptyView()
        }.fixedSize()
        
    }
}

struct BindableView: View {
    
    @State private var light: Light = Light()
    
    var body: some View {
        VStack {
            Room(light: light)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(light.isOn ? .cyan : .black)
    }
}
#Preview {
    BindableView()
}
