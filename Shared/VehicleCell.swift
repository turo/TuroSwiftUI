//
//  VehicleCell.swift
//  SwiftUIExample
//
//  Created by Luke Solomon on 7/14/22.
//

//import SwiftUI
//
//class VehicleCellViewModel: ObservableObject {
//
//    var cellTitle: String
//    var cellSubtitle: String
//
//    init(vehicle: Vehicle) {
//        self.cellTitle = vehicle.owner + "'s " + vehicle.make
//        self.cellSubtitle = vehicle.makeModel
//    }
//
//}
//
//struct VehicleCell: View {
//    @ObservedObject var viewModel: VehicleCellViewModel
//
//    var body: some View {
//        Text(viewModel.title).fontWeight(.bold)
//        Text(viewModel.subtitle).fontWeight(.light)
//    }
//}
//
//struct VehicleCell_Previews: PreviewProvider {
//    static var previews: some View {
//        VehicleCell(
//            viewModel: VehicleCellViewModel(
//                vehicle: Vehicle(
//            )
//        )
//    }
//}
