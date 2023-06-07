//
//  FieldsView.swift
//  SmashBooking
//
//  Created by Bernardo Vera on 5/6/23.
//

import SwiftUI

struct FieldsView: View {
    
    let field: Facility
    
    var body: some View {
        HStack {
            Image(systemName: "figure.tennis")
                .foregroundStyle(.blue)
            
            VStack( spacing: 5){
                Text(field.name)
                    .fontWeight(.bold)
                Text(field.type)
                    .font(.caption2)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            
            if field.availability == false {
                Spacer()
                Image(systemName: "xmark.circle")
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(.grayBackground)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        
    }
}

struct FieldsView_Previews: PreviewProvider {
    
   
        
      
    static var previews: some View {
        FieldsView(field: Facility.example)
    }
}
