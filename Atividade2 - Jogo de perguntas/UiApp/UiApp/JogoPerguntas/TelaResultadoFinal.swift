import SwiftUI

struct TelaResultadoFinal: View {

    let acertos: Int
    let total: Int

    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(spacing: 24) {

            Text("Resultado Final")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("✅ Acertos: \(acertos)")
                .font(.title2)

            Text("❌ Erros: \(total - acertos)")
                .font(.title2)

            Button {
                dismiss()
            } label: {
                Text("Jogar Novamente")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
        }
        .padding()
    }
}
