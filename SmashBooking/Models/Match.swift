//
//  Match.swift
//  SmashBooking
//
//  Created by Bernardo Vera on 5/6/23.
//

import Foundation

struct Match: Identifiable, Codable{
    let id: UUID
    var court: String
    var date: String
    var startTime: String
    var endTime: String
    var teams: [Team]
    var winner: String
    var score: [String]
    
    init(id: UUID = UUID(), court: String, date: String, startTime: String, endTime: String, teams: [Team], winner: String, score: [String]) {
        self.id = id
        self.court = court
        self.date = date
        self.startTime = startTime
        self.endTime = endTime
        self.teams = teams
        self.winner = winner
        self.score = score
    }
}

extension Match {
    
    struct Team: Codable, Identifiable {
        let id: UUID
        var name: String
        var player1: String
        var player2: String
        var gamesWon: Int
        var gamesLost: Int
        var setsWon: Int
        
        init(id: UUID = UUID(), name: String, player1: String = "Available", player2: String = "Available", gamesWon: Int = 0, gamesLost: Int = 0, setsWon: Int = 0) {
            self.id = id
            self.name = name
            self.player1 = player1
            self.player2 = player2
            self.gamesWon = gamesWon
            self.gamesLost = gamesLost
            self.setsWon = setsWon
        }
    }
    
    static var emptyMatch: Match {
        Match(court: "", date: "", startTime: "", endTime: "", teams: [], winner: "", score: [])
    }
}

extension Match {
    static let sampleData: [Match] = [
        Match(court: "Padel 1", date: "12-06-2023", startTime: "12:00", endTime: "13:00", teams: [Team(name: "Team 1", player1: "Berni Rodriguez", player2: "George Curry", gamesWon: 2, gamesLost: 3, setsWon: 2), Team(name: "Team 2", player1: "Peter Swift", player2: "Available", gamesWon: 2, gamesLost: 3, setsWon: 4)], winner: "Team 1", score: ["2-6", "2-4"]),
        Match(court: "Padel 3", date: "12-07-2023", startTime: "13:00", endTime: "15:00", teams: [Team(name: "Team 1"), Team(name: "Team 2")], winner: "", score: [""])
    ]
}



