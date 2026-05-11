import SwiftUI

struct CartRow: View {
    var item: CartItem
    var onIncrease: () -> Void
    var onDecrease: () -> Void

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.bike.name)
                    .font(.headline)
                Text("R$ \(item.bike.price, specifier: "%.0f")")
                    .foregroundColor(.secondary)
            }
            Spacer()
            Button(action: onDecrease) {
                Image(systemName: "minus.circle")
            }
            Text("\(item.quantity)")
                .frame(minWidth: 20)
            Button(action: onIncrease) {
                Image(systemName: "plus.circle")
            }
        }
        .padding(.vertical, 4)
    }
}
