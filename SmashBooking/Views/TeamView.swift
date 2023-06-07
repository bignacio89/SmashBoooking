//
//  TeamView.swift
//  SmashBooking
//
//  Created by Bernardo Vera on 6/6/23.
//

import SwiftUI

struct TeamView: View {
    let team: Match.Team
    var isEmpty = "Available"
    
    var body: some View {
        
        VStack(alignment: .leading){
            Text(team.player1)
                .foregroundColor(team.player1 == isEmpty ? .blue : .black)
                .padding(.bottom)
            Text(team.player2)
                .foregroundColor(team.player2 == isEmpty ? .blue : .black)
        }
    }
}

struct TeamView_Previews: PreviewProvider {
    static var team: Match.Team = Match.Team(name: "Team 1", player1: "Bernardo Vera", player2: "Available", gamesWon: 2, gamesLost: 1, setsWon: 1)
    static var previews: some View {
        TeamView(team: team)
    }
}
