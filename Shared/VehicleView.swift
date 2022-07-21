//
//  VehicleView.swift
//  Shared
//
//  Created by Luke Solomon on 7/14/22.
//

import SwiftUI

@MainActor class VehicleViewModel: ObservableObject {
    var title: String
    var subtitle: String

    let imageURL: URL
    @Published var image: UIImage?

    let dataManager: DataManageable

    init(vehicle: Vehicle, dataManager: DataManageable) {
        self.title = vehicle.owner + "'s " + vehicle.make
        self.subtitle = vehicle.makeModel
        self.imageURL = vehicle.imageURL
        self.dataManager = dataManager
    }

    func fetchImage() async {
        do {
            self.image = try await dataManager.fetchImage(forURL: imageURL)
        } catch {
            self.image = nil
        }
    }
}

struct VehicleView: View {
    @ObservedObject var viewModel: VehicleViewModel

    var body: some View {
        VStack {
            Image(uiImage: viewModel.image ?? UIImage(imageLiteralResourceName: "fetchFailed"))
                .resizable()
                .aspectRatio(contentMode: .fit)

            Text(viewModel.title).padding()
            Text(viewModel.subtitle).padding()
        }
        .task {
            await viewModel.fetchImage()
        }
    }
}

struct VehicleView_Previews: PreviewProvider {

    static var previews: some View {
        VehicleView(
            viewModel: VehicleViewModel(
                vehicle: Vehicle(
                    owner: "Luke",
                    make: "BMW",
                    model: "M3",
                    year: 2004,
                    imageURL: URL(string: bmwURL)!,
                    vehicleId: 12
                ), dataManager: MockDataManager()
            )
        )
    }
}


