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
    private let favouriteTip = FavouriteTip()
    private let infoTip = InformationTip()
    private let locationsTip = LocationsTip()

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
                                print(favouriteTip.status, FavouriteTip.numberOfTimesVisited)
                            }, label: {
                                Image(systemName: "star")
                            })
                            .popoverTip(favouriteTip, arrowEdge: .top)
                        }
                    }
                    .onAppear {
                        Task {
                            await FavouriteTip.numberOfTimesVisited.donate()
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    NavigationLink {
                        VStack {
                            Text("Information")
                        }
                        .onAppear {
                            Task {
                                await InformationTip.visitViewEvent.donate()
                            }
                        }
                    } label: {
                        Image(systemName: "info.circle")
                    }
                    .popoverTip(infoTip, arrowEdge: .top)
                }

                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        VStack {
                            List {
                                TipView(locationsTip)
                                    .listRowSeparator(.hidden)
                                Text("Location1")
                                    .listRowSeparator(.hidden)
                                Text("Location2")
                                    .listRowSeparator(.hidden)
                                Text("Location3")
                                    .listRowSeparator(.hidden)
                            }
                        }
                        .toolbar {
                            ToolbarItem(placement: .topBarTrailing) {
                                Button(action: {
                                    Task {
                                        await LocationsTip.addFavoriteEvent.donate()
                                    }
                                }, label: {
                                    Image(systemName: "plus")
                                })
                            }
                        }
                        .navigationTitle("Locations")
                        

                    } label: {
                        Label("Locations", systemImage: "map")
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        ContentView()
            .task {
                try? Tips.resetDatastore()
                try? Tips.configure ([
                    .displayFrequency(.immediate),
                    .datastoreLocation(.applicationDefault)
                ])
            }
    }
}
