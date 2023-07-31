//
//  FavouriteTip.swift
//  TipKitDemo
//
//  Created by Pawel Milek on 7/31/23.
//

import SwiftUI
import TipKit

struct FavouriteTip: Tip {
    @Parameter
    static var showTip: Bool = true
    static var numberOfTimesVisited: Event = Event(id: "milek.pawel.tipkitdemo.numberoftimesvisited")

    var title: Text {
        Text("Move contacts to favourites")
    }

    var message: Text? {
        Text("Frequently opened Chats can be moved to favourites for ease of use.")
    }

    var asset: Image? {
        Image(systemName: "star")
    }

    var rules: [Rule] {
//        [#Rule(Self.$showTip) { $0 == true } ]
        [#Rule(Self.numberOfTimesVisited) { $0.donations.count > 3 }]
    }

    var options: [TipOption] {
        [Tip.MaxDisplayCount(2)]
    }
}
