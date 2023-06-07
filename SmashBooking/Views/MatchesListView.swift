//
//  MatchesListView.swift
//  SmashBooking
//
//  Created by Bernardo Vera on 6/6/23.
//

import SwiftUI

struct MatchesListView: View {
    @Binding var matches: [Match]
    @Environment(\.scenePhase) private var scenePhase
    let saveAction: () -> Void
    
    var body: some View {
        NavigationStack {
            List($matches) { $match in
                MatchCardView(match: match)
            
            }
        }
    }
}

struct MatchesListView_Previews: PreviewProvider {
    static var previews: some View {
        MatchesListView(matches: .constant(Match.sampleData), saveAction: {})
    }
}
