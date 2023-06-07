//
//  MainTheme.swift
//  SmashBooking
//
//  Created by Bernardo Vera on 1/6/23.
//

import Foundation
import SwiftUI

extension ShapeStyle where Self == Color {
    static var selectedBackground: Color {
        Color(red: 1, green: 189/255, blue: 3/255)
    }

    static var lightBackground: Color {
        Color(red: 0.2, green: 0.2, blue: 0.3)
    }
    
    static var grayBackground: Color { Color(red: 238/255, green: 238/255, blue: 238/255) }
}
