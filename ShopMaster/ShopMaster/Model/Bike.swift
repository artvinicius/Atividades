import Foundation

struct Bike: Identifiable, Equatable {
    var id = UUID()
    var name: String
    var brand: String
    var price: Double
    var stock: Int = 3
}
