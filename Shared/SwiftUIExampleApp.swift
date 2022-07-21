//
//  SwiftUIExampleApp.swift
//  Shared
//
//  Created by Luke Solomon on 7/14/22.
//

import SwiftUI

@main
struct SwiftUIExampleApp: App {
    var body: some Scene {
        WindowGroup {
            VehicleView(
                viewModel: VehicleViewModel(
                    vehicle: Vehicle(
                        owner: "Luke",
                        make: "BMW",
                        model: "M3",
                        year: 2004,
                        imageURL: URL(string: bmwURL)!,
                        vehicleId: 1
                    ),
                    dataManager: Instances.shared.dataManager
                )
            )
        }
    }
}


