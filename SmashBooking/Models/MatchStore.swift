//
//  MatchStore.swift
//  SmashBooking
//
//  Created by Bernardo Vera on 6/6/23.
//

import SwiftUI

@MainActor
class MatchStore: ObservableObject {
    @Published var matches: [Match] = []
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("matches.data")
    }
    
    func load() async throws {
        let task = Task<[Match], Error> {
            let fileURL = try Self.fileURL()
            guard let data = try? Data(contentsOf: fileURL) else {
                return []
            }
            let matchesData = try JSONDecoder().decode([Match].self, from: data)
            return matchesData
        }
        let matches = try await task.value
        self.matches = matches
    }
    
    func save(matches: [Match]) async throws {
        let task = Task {
            let data = try JSONEncoder().encode(matches)
            let outfile = try Self.fileURL()
            try data.write(to: outfile)
        }
        _ = try await task.value
    }
}
