import SwiftUI

struct BrandView: View {
    var brand: String
    @ObservedObject var bikeVM: BikeViewModel
    @ObservedObject var cartVM: CartViewModel
    @Environment(\.dismiss) var dismiss

    var body: some View {
        List(bikeVM.bikes(for: brand)) { bike in
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    VStack(alignment: .leading) {
                        Text(bike.name)
                            .font(.headline)
                        Text("R$ \(bike.price, specifier: "%.0f")")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    Spacer()
                    Text("Estoque: \(bike.stock - cartVM.quantity(of: bike))")
                        .font(.caption)
                        .foregroundColor(cartVM.isAtLimit(bike) ? .red : .green)
                }

                HStack {
                    Spacer()
                    if cartVM.isAtLimit(bike) {
                        Text("⚠️ Indisponível")
                            .font(.caption)
                            .foregroundColor(.red)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .background(Color.red.opacity(0.1))
                            .cornerRadius(8)
                    } else {
                        Button(action: { cartVM.add(bike) }) {
                            HStack {
                                Image(systemName: "cart.badge.plus")
                                Text("Adicionar")
                            }
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(Color.blue)
                            .cornerRadius(10)
                        }
                    }
                }
            }
            .padding(.vertical, 4)
        }
        .listStyle(.insetGrouped)
        .navigationBarHidden(true)
        .safeAreaInset(edge: .top) {
            HStack {
                Button(action: { dismiss() }) {
                    Image(systemName: "chevron.left")
                        .font(.title3)
                        .foregroundColor(.primary)
                }
                Text(brand)
                    .font(.system(size: 22, weight: .black, design: .rounded))
                Spacer()
                NavigationLink(destination: CartView(cartVM: cartVM)) {
                    ZStack(alignment: .topTrailing) {
                        Image(systemName: "cart")
                            .font(.title2)
                        if cartVM.totalItems > 0 {
                            Text("\(cartVM.totalItems)")
                                .font(.caption2).bold()
                                .foregroundColor(.white)
                                .padding(4)
                                .background(Color.red)
                                .clipShape(Circle())
                                .offset(x: 10, y: -10)
                        }
                    }
                }
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 12)
            .background(Color(.systemBackground))
        }
    }
}
