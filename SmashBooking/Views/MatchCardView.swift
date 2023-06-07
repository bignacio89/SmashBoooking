//
//  MatchCardView.swift
//  SmashBooking
//
//  Created by Bernardo Vera on 6/6/23.
//

import SwiftUI

struct MatchCardView: View {
    
    let match: Match
    
    var body: some View {
        
        VStack() {
            HStack {
                Text("\(match.date) | \(match.startTime)")
                    .font(.headline)
                Spacer()
                Text("Booked")
            }
            .padding(.bottom, 5)
            HStack {
                Image(systemName: "tennis.racket")
                Text(match.court)
                Spacer()
            }
            .padding(.bottom, 10)
            
            HStack{
               
                TeamView(team: match.teams[0])
                Divider()
                    .padding([.leading, .trailing])
                TeamView(team: match.teams[1])
            }
            Spacer()
            
    
        }
        
    }
}

struct MatchCardView_Previews: PreviewProvider {
    static var match = Match.sampleData[0]
    static var previews: some View {
        MatchCardView(match: match)
    }
}
