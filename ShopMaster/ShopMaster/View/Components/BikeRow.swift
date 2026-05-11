
import SwiftUI

struct BikeRow: View {
    var bike: Bike
    var onAdd: () -> Void

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(bike.name)
                    .font(.headline)
                Text(bike.brand)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer()
            Text("R$ \(bike.price, specifier: "%.0f")")
                .bold()
            Button(action: onAdd) {
                Image(systemName: "cart.badge.plus")
                    .foregroundColor(.blue)
            }
        }
        .padding(.vertical, 4)
    }
}
