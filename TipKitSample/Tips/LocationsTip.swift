//
//  LocationsTip.swift
//  TipKitSample
//
//  Created by Pawel Milek on 12/29/23.
//

import TipKit

struct LocationsTip: Tip {
    static let addFavoriteEvent = Event(id: "AddFavoriteEvent")

    init() { }

    public var title: Text {
        Text("Locations")
            .fontWeight(.bold)
            .fontDesign(.monospaced)
    }

    public var message: Text? {
        Text("Search and add your favorite locations.")
            .fontDesign(.monospaced)
    }

    public var image: Image? {
        Image(systemName: "mappin.circle.fill")
    }

    public var rules: [Rule] {
        [
            #Rule(Self.addFavoriteEvent) { event in
                event.donations.count == 0
            }
        ]
    }
}
