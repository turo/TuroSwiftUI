//
//  DataManager.swift
//  SwiftUIExample
//
//  Created by Luke Solomon on 7/20/22.
//

import Foundation
import SwiftUI

protocol DataManageable {
    func fetchVehicle(forID: Int) -> Vehicle
    func fetchImage(forURL url: URL) async throws -> UIImage
    func fetch<T: Fetchable>(object: T.Type) -> T.O
}

protocol Fetchable {
    associatedtype I // input - this is where the parameters go!
    associatedtype O // output - what you need to initialize the object

    init(dataManager: DataManageable, _ i: I)
}

actor DataManager: DataManageable {

    // This would be an async function that would call an endpoint...if I had one
    nonisolated func fetchVehicle(forID: Int) -> Vehicle {
        return Vehicle(
            owner: "",
            make: "",
            model: "",
            year: 2000,
            imageURL: URL(string: "https://imgur.com/wag245")!,
            vehicleId: 1
        )
    }

    nonisolated func fetch<T: Fetchable>(object: T.Type) -> T.O {
        // Talks to the cacheManagers & Network Managers, translates the input params and fetches anything needed to initialize an object.
        // Here it just returns Data, as an example.
        return Data() as! T.O
    }

    func fetchImage(forURL url: URL) async throws -> UIImage {
        let task: Task<UIImage, Error> = Task {
            let (imageData, _) = try await URLSession.shared.data(for: URLRequest(url: url))
            let image = UIImage(data: imageData)!
            return image
        }
        return try await task.value
    }

}


class MockDataManager: DataManageable {
    func fetch<T: Fetchable>(object: T.Type) -> T.O {
        return Data() as! T.O
    }

    func fetchVehicle(forID: Int) -> Vehicle {
        Vehicle(
            owner: "",
            make: "",
            model: "",
            year: 2000,
            imageURL: URL(string: bmwURL)!,
            vehicleId: 1
        )
    }

    func fetchImage(forURL url: URL) async throws -> UIImage {
        return UIImage(imageLiteralResourceName: "Image")
    }

}
