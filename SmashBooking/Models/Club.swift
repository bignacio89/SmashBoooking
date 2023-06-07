//
//  Club.swift
//  SmashBooking
//
//  Created by Bernardo Vera on 5/6/23.
//

import Foundation

struct Club: Codable {
    let clubName: String
    let location: String
    let contact: Contact
    let openingHours: OpeningHours
    let facilities: [Facility]
    let priceTypes: [PriceType]
    let coaches: [Coach]
    
    init(clubName: String, location: String, contact: Contact, openingHours: OpeningHours, facilities: [Facility], priceTypes: [PriceType], coaches: [Coach]) {
        self.clubName = clubName
        self.location = location
        self.contact = contact
        self.openingHours = openingHours
        self.facilities = facilities
        self.priceTypes = priceTypes
        self.coaches = coaches
    }
}

struct Contact: Codable {
    let email: String
    let phone: String
}

struct OpeningHours: Codable {
    let start: Int
    let end: Int
}

struct Facility: Codable, Identifiable {
    let id: UUID?
    let name: String
    let capacity: Int
    let type: String
    let availability: Bool
    
    static var example = Facility(id: UUID(), name: "Padel 1", capacity: 4, type: "Outdoor", availability: true)
    
    init(id: UUID = UUID(), name: String, capacity: Int, type: String, availability: Bool) {
        self.id = id
        self.name = name
        self.capacity = capacity
        self.type = type
        self.availability = availability
    }
    
    
}

struct PriceType: Codable {
    let type: String
    let pricePerHour: Int
}

struct Coach: Codable {
    let name: String
    let specialty: String
}

