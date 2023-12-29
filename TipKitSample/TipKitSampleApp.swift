//
//  TipKitSampleApp.swift
//  TipKitSample
//
//  Created by Pawel Milek on 7/31/23.
//

import SwiftUI
import TipKit

@main
struct TipKitSampleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .task {
                    do {
                        try Tips.resetDatastore()
                        try Tips.configure([
                            .displayFrequency(.immediate),
                            .datastoreLocation(.applicationDefault)
                        ])
                    } catch {
                        debugPrint(error.localizedDescription)
                    }
                }
        }
    }
}
