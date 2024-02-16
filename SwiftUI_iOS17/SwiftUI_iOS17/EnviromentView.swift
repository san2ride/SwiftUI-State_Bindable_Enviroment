//
//  EnviromentView.swift
//  SwiftUI_iOS17
//
//  Created by don't touch me on 2/15/24.
//

import SwiftUI
import SwiftData

@Observable
class LightSwitch {
    var isOn: Bool = false
}

struct LightView: View {
    @Bindable var lightSwitch: LightSwitch
    
    var body: some View {
        Toggle(isOn: $lightSwitch.isOn) {
            EmptyView()
        }.fixedSize()
    }
}

struct LivingRoom: View {
    
    @Environment(LightSwitch.self) private var lightSwitch
    
    var body: some View {
        LightView(lightSwitch: lightSwitch)
    }
}

struct Cabin: View {
    
    @Environment(LightSwitch.self) private var lightSwitch
    
    var body: some View {
        Image(systemName: lightSwitch.isOn ? "lightbulb.fill" : "lightbulb")
            .font(.largeTitle)
    }
}

struct EnviromentView: View {
    
    @Environment(LightSwitch.self) private var lightSwitch
    
    var body: some View {
        VStack {
            LivingRoom()
            Cabin()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(lightSwitch.isOn ? .cyan : .red)
    }
}
#Preview {
    EnviromentView()
        .environment(LightSwitch())
}
