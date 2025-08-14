//
//  SettingsButton.swift
//  SimplyTrack
//
//  Created by Farhan Hamim on 7/14/25.
//

import SwiftUI

enum AppTheme: String, CaseIterable, Identifiable {
    case system, light, dark
    var id: Self {self}
}

struct SettingsView: View {
    @AppStorage("selectedTheme") private var selectedTheme: AppTheme = .system
    var body: some View {
        
        Form{
            Section(header: Text("Appearance")) {
                Picker("App Theme", selection: $selectedTheme) {
                    Text("System Default").tag(AppTheme.system)
                    Text("Light").tag(AppTheme.light)
                    Text("Dark").tag(AppTheme.dark)
                }
                .pickerStyle(.segmented)
            }
        }
            .navigationTitle("Settings")
    }
}

#Preview {
    SettingsView()
}
