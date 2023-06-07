//
//  SmashBookingApp.swift
//  SmashBooking
//
//  Created by Bernardo Vera on 1/6/23.
//

import SwiftUI

@main
struct SmashBookingApp: App {
    @StateObject private var store = MatchStore()
    @State private var errorWrapper: ErrorWrapper?

    var body: some Scene {
        WindowGroup {
            ContentView(matches: $store.matches) {
                Task {
                    do {
                        try await store.save(matches: store.matches)
                    } catch {
                        errorWrapper = ErrorWrapper(error: error, guidance: "Try again later")
                    }
                }
            }
            .task {
                do {
                    try await store.load()
                }
                catch {
                    errorWrapper = ErrorWrapper(error: error, guidance: "App will load sample data and continue.")
                }
            }
            .sheet(item: $errorWrapper){
                store.matches = Match.sampleData
            } content: { wrapper in ErrorView(errorWrapper: wrapper)
                
            }
        }
    }
}
