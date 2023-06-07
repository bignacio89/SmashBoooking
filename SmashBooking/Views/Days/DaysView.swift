//
//  DaysView.swift
//  SmashBooking
//
//  Created by Bernardo Vera on 2/6/23.
//

import SwiftUI

struct DaysView: View {
    
    private var numberOfDaysToShow: Int = 20
    
    
    @State private var isSelected: Bool = false
    @State private var selectedIndex = 0
    @State private var selectedDate: Date = Date()
    
    
    let columns = [GridItem(.adaptive(minimum: 60))]
    
    var body: some View {
        
        VStack {
            Text(selectedDate.toString(format: "EEEE, dd.MM.yyyy"))
                .font(.caption)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach (0..<numberOfDaysToShow, id: \.self) { i in
                        Button(action: {
                            selectedIndex = i
                        }) {
                            VStack () {
                                Text(getDate(at: i).toString(format: "EEE").uppercased())
                                    .fontWeight(.semibold)
                                    .frame(maxWidth:.infinity)
                                Spacer()
                                    .frame(height: 4)
                                ZStack {
                                    HStack {
                                        Spacer()
                                            .frame(width: 6)
                                        Circle()
                                            .frame(width: 33)
                                            .foregroundColor( i == selectedIndex ? .yellow : .clear)
                                        Spacer()
                                            .frame(width: 6)
                                    }
                                    Text(getDate(at: i).toString(format: "d"))
                                        .frame(maxWidth: .infinity)
                                }
                            }
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(.bordered)
                    }
                }
            }
        }
    }
    
    private func getDate(at index: Int) -> Date {
        return Calendar.current.date(byAdding: .day, value: index, to: Date()) ?? Date()
    }
    
}


struct DaysView_Previews: PreviewProvider {
    
    static var previews: some View {
        DaysView()
    }
}
