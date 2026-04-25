import SwiftUI

struct TelaInicial: View {

    @State private var temaSelecionado: String?
    @State private var iniciarJogo = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {

                Text("Jogo de Perguntas")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text("Escolha um tema")
                    .font(.title2)

                ForEach(Perguntas.temas, id: \.self) { tema in
                    Button {
                        temaSelecionado = tema
                        iniciarJogo = true
                    } label: {
                        Text(tema)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                }
            }
            .padding()
            .navigationDestination(isPresented: $iniciarJogo) {
                TelaJogo(tema: temaSelecionado ?? "")
            }
        }
    }
}
