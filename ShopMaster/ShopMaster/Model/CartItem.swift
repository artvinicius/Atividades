import Foundation

struct CartItem: Identifiable {
    var id = UUID()
    var bike: Bike
    var quantity: Int
}
