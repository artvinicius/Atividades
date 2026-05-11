import Foundation
import Combine

class BikeViewModel: ObservableObject {

    @Published var bikes: [Bike] = [
        Bike(name: "Stumpjumper", brand: "Specialized", price: 18999),
        Bike(name: "Epic 8",      brand: "Specialized", price: 32500),
        Bike(name: "Fuel EX 9",   brand: "Trek",        price: 24900),
        Bike(name: "Domane AL 3", brand: "Trek",        price: 9800),
        Bike(name: "Scalpel HT",  brand: "Cannondale",  price: 21000),
        Bike(name: "Trail 8",     brand: "Cannondale",  price: 5900)
    ]

    var specialized: [Bike] { bikes.filter { $0.brand == "Specialized" } }
    var trek: [Bike]        { bikes.filter { $0.brand == "Trek" } }
    var cannondale: [Bike]  { bikes.filter { $0.brand == "Cannondale" } }

    let brands = ["Specialized", "Trek", "Cannondale"]

    func bikes(for brand: String) -> [Bike] {
        bikes.filter { $0.brand == brand }
    }
}
