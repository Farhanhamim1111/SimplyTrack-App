//
//  SimplyTrackApp.swift
//  SimplyTrack
//
//  Created by Farhan Hamim on 7/5/25.
//

import SwiftUI

@main
struct SimplyTrackApp: App {
    @AppStorage("selectedTheme") private var selectedTheme: AppTheme = .system
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(
                    selectedTheme == .system ? nil :
                        (selectedTheme == .light ? .light : .dark)
                )
        }
    }
}
