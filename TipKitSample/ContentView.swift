//
//  ContentView.swift
//  TipKitDemo
//
//  Created by Pawel Milek on 7/31/23.
//

import SwiftUI
import TipKit
import OSLog

struct ContentView: View {
    private let tip = FavouriteTip()

    var body: some View {
        NavigationStack {
            List {
                NavigationLink("iPawel") {
                    VStack {
                        Text("Content")
                            .font(.largeTitle)
                            .bold()
                    }
                    .navigationTitle("iPawel")
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            Button(action: {
                                print(tip.status, FavouriteTip.numberOfTimesVisited)
                            }, label: {
                                Image(systemName: "star")
                            })
                            .popoverTip(tip, arrowEdge: .top, action: { action in

                            })
                        }
                    }
                    .onAppear {
                        Task {
                            await FavouriteTip.numberOfTimesVisited.donate()
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        ContentView()
    }
}
