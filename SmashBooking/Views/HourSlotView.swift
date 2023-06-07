//
//  HourSlotView.swift
//  SmashBooking
//
//  Created by Bernardo Vera on 5/6/23.
//

import SwiftUI

struct HourSlotView: View {
    @State var hours: String = "19:00"
    
    @State private var isSelected: Bool = false
    
    var body: some View {
        
        RoundedRectangle(cornerRadius: 10)
            .fill(isSelected ? .selectedBackground : .grayBackground)
            .frame(width: 55, height: 35)
            .overlay {
                Text(hours)
                    .font(.subheadline)
                    .bold()
            }
            .gesture(
                TapGesture()
                    .onEnded{ gesture in
                        isSelected.toggle()
                        
                    })
    }
}

struct HourSlotView_Previews: PreviewProvider {
    static private var hours: String = "19:00"
   
   static var previews: some View {
       
       HourSlotView( hours: hours)
   }
}
