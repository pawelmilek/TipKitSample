//
//  InformationTip.swift
//  TipKitSample
//
//  Created by Pawel Milek on 12/29/23.
//

import TipKit

struct InformationTip: Tip {
    static let visitViewEvent = Event(id: "visitViewEvent")

    init() { }

    var title: Text {
        Text("Information")
            .fontWeight(.bold)
            .fontDesign(.monospaced)
    }

    var message: Text? {
        Text("Find important details about the app, feedback and more.")
            .fontDesign(.monospaced)
    }

    var image: Image? {
        Image(systemName: "info.circle.fill")
    }

    var rules: [Rule] {
        [
            #Rule(Self.visitViewEvent) { event in
                event.donations.count == 0
            }
        ]
    }
}
