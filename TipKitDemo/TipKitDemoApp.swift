//
//  TipKitDemoApp.swift
//  TipKitDemo
//
//  Created by Pawel Milek on 7/31/23.
//

import SwiftUI
import TipKit

@main
struct TipKitDemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .task {
                    do {
                        try await Tips.configure {
                            DisplayFrequency(.immediate)
                            DatastoreLocation(.applicationDefault)
                        }
                    } catch {
                        debugPrint(error.localizedDescription)
                    }
                }
        }
    }
}
