import SwiftUI

struct CartView: View {
    @ObservedObject var cartVM: CartViewModel

    var body: some View {
        List {
            ForEach(cartVM.items) { item in
                HStack {
                    VStack(alignment: .leading) {
                        Text(item.bike.name)
                            .font(.headline)
                        Text(item.bike.brand)
                            .font(.caption)
                            .foregroundColor(.secondary)
                        Text("R$ \(item.bike.price, specifier: "%.0f") / un")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }

                    Spacer()

                    VStack(alignment: .trailing, spacing: 6) {
                        Text("R$ \(item.bike.price * Double(item.quantity), specifier: "%.0f")")
                            .font(.subheadline)
                            .bold()

                        HStack(spacing: 12) {
                            Button(action: { cartVM.decrease(item) }) {
                                Image(systemName: "minus.circle.fill")
                                    .foregroundColor(.red)
                                    .font(.title3)
                            }
                            .buttonStyle(BorderlessButtonStyle())

                            Text("\(item.quantity)")
                                .font(.headline)
                                .frame(minWidth: 20)

                            Button(action: { cartVM.add(item.bike) }) {
                                Image(systemName: "plus.circle.fill")
                                    .foregroundColor(.green)
                                    .font(.title3)
                            }
                            .buttonStyle(BorderlessButtonStyle())
                        }
                    }
                }
                .padding(.vertical, 4)
            }
            .onDelete { offsets in
                cartVM.remove(at: offsets)
            }

            if !cartVM.items.isEmpty {
                HStack {
                    Text("Total")
                        .font(.headline)
                    Spacer()
                    Text("R$ \(cartVM.total, specifier: "%.0f")")
                        .font(.headline)
                        .bold()
                }
                .padding(.vertical, 4)
            }
        }
        .listStyle(.insetGrouped)
        .navigationTitle("Carrinho")
        .overlay {
            if cartVM.items.isEmpty {
                VStack(spacing: 12) {
                    Image(systemName: "cart")
                        .font(.system(size: 60))
                        .foregroundColor(.secondary)
                    Text("Carrinho vazio")
                        .foregroundColor(.secondary)
                }
            }
        }
    }
}
