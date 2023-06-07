//
//  ContentView.swift
//  SmashBooking
//
//  Created by Bernardo Vera on 1/6/23.
//

import SwiftUI

struct ContentView: View {
    @Binding var matches: [Match]
    @Environment(\.scenePhase) private var scenePhase
    
    @State private var club: Club = Bundle.main.decode(Club.self, from: "club.json")
    let saveAction: ()->Void
    
    let columms = [GridItem(.adaptive(minimum: 60))]
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                VStack {
                    
                    VStack(alignment: .leading){
                        Text(club.clubName)
                            .font(.headline)
                        Text(club.location)
                            .font(.caption)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(.blue), style: StrokeStyle(lineWidth: 3)))
                    
                    Divider()
                        .padding([.bottom, .top])
                    
                    DaysView()
                    
                    Divider()
                        .padding()
                    
                    LazyVGrid(columns: columms) {
                        ForEach(createTimeSlots(startTime: club.openingHours.start, endTime: club.openingHours.end), id: \.self){ hour in
                            HourSlotView(hours: hour)
                        }
                    }
                    
                    Divider()
                        .padding([.top, .bottom])
                    
                    Text(matches[0].teams[0].player1)
                        
                    VStack{
                            ForEach(club.facilities.indices, id: \.self) { index in
                                FieldsView(field: club.facilities[index])
                            }
                        }
                }
                .padding()
            }
        }
    }
    func createTimeSlots(startTime: Int, endTime: Int) -> [String] {
        
        var timeSlots: [String] = []
        
        for hour in startTime..<endTime {
            if hour < 10 {
                timeSlots.append("0\(hour):00")
            } else {
                timeSlots.append("\(hour):00")
            }
        }
        return timeSlots
    }
}
    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(matches: .constant(Match.sampleData), saveAction: {})
    }
}
