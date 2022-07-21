//
//  Vehicle.swift
//  SwiftUIExample
//
//  Created by Luke Solomon on 7/14/22.
//

import Foundation

struct Vehicle: Codable, Fetchable {

    var owner: String
    var make: String
    var model: String
    var year: Int
    var imageURL: URL
    var vehicleId: Int

    var makeModel: String {
        return "\(year) \(make) \(model)"
    }

    init(
        owner: String,
        make: String,
        model: String,
        year: Int,
        imageURL: URL,
        vehicleId: Int
    ) {
        self.owner = owner
        self.make = make
        self.model = model
        self.year = year
        self.imageURL = imageURL
        self.vehicleId = vehicleId
    }


    typealias I = [String] // could be parameters
    typealias O = Data

    init(dataManager: DataManageable, _ i: I) {
        let data = dataManager.fetch(object: Vehicle.self)
        self.owner = data.description // etc etc
        self.make = data.debugDescription
        self.model = data.base64EncodedString()
        self.year = 2004
        self.imageURL = URL(string: bmwURL)!
        self.vehicleId = 12
    }

    // multiple intializers
//    init(with vehicleListingResponse: RRVehicleListingResponse) {
    // This is where we turn a DTO in a model
//        self.make = vehicleListingResponse.vehicle.make
//        ...
//    }

    // you could have other initializers for other types...
//    init(with vehicleResponse: RRHeroVehicleResponse) {
    // This is where we turn a DTO in a model
//        self.make = vehicleListingResponse.vehicle.make
//        ...
//    }

    // You could even have methods that would fetch the data, given what little information you have
//    init?(fetchVehicleResponse vehicleId: Int, dataManager: DataManageable) {
//
//    }
}

let vehicle = Vehicle(dataManager: MockDataManager(), ["Parameter"])
