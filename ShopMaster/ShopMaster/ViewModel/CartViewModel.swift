import Foundation
import Combine
import SwiftUI

class CartViewModel: ObservableObject {

    @Published var items: [CartItem] = []

    var total: Double {
        items.reduce(0) { $0 + ($1.bike.price * Double($1.quantity)) }
    }

    var totalItems: Int {
        items.reduce(0) { $0 + $1.quantity }
    }

    func quantity(of bike: Bike) -> Int {
        items.first(where: { $0.bike.id == bike.id })?.quantity ?? 0
    }

    func isAtLimit(_ bike: Bike) -> Bool {
        quantity(of: bike) >= bike.stock
    }

    func add(_ bike: Bike) {
        guard !isAtLimit(bike) else { return }
        if let index = items.firstIndex(where: { $0.bike.id == bike.id }) {
            items[index].quantity += 1
        } else {
            items.append(CartItem(bike: bike, quantity: 1))
        }
    }

    func decrease(_ item: CartItem) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            if items[index].quantity > 1 {
                items[index].quantity -= 1
            } else {
                items.remove(at: index)
            }
        }
    }

    func remove(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
}
