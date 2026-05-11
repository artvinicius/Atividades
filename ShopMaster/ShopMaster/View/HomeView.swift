import SwiftUI

struct HomeView: View {
    @StateObject var bikeVM = BikeViewModel()
    @StateObject var cartVM  = CartViewModel()

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                HStack {
                    Text("SHOPMASTER")
                        .font(.system(size: 28, weight: .black, design: .rounded))
                        .tracking(2)
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
                .padding(.top, 60)
                .padding(.bottom, 20)

                Text("Escolha uma marca")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .padding(.bottom, 12)

                List(bikeVM.brands, id: \.self) { brand in
                    NavigationLink(destination: BrandView(brand: brand, bikeVM: bikeVM, cartVM: cartVM)) {
                        HStack(spacing: 16) {
                            Image(systemName: "bicycle")
                                .font(.title2)
                                .foregroundColor(.blue)
                                .frame(width: 44, height: 44)
                                .background(Color.blue.opacity(0.1))
                                .cornerRadius(10)

                            VStack(alignment: .leading) {
                                Text(brand)
                                    .font(.headline)
                                Text("\(bikeVM.bikes(for: brand).count) modelos")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding(.vertical, 6)
                    }
                }
                .listStyle(.insetGrouped)
            }
            .navigationBarHidden(true)
        }
    }
}
