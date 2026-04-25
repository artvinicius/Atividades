import SwiftUI

struct TelaJogo: View {

    let tema: String

    @State private var indiceQuestao = 0
    @State private var acertos = 0

    @State private var mostrarFeedback = false
    @State private var mensagemFeedback = ""
    @State private var respostaBloqueada = false

    @State private var mostrarResultadoFinal = false

    var questoes: [Questao] {
        Perguntas.questoesPorTema[tema] ?? []
    }

    var body: some View {
        VStack {
            if mostrarResultadoFinal {
                TelaResultadoFinal(
                    acertos: acertos,
                    total: questoes.count
                )
            } else {
                conteudoJogo
            }
        }
    }

    var conteudoJogo: some View {
        VStack(spacing: 20) {

            Text("Tema: \(tema)")
                .font(.headline)

            Text("Pergunta \(indiceQuestao + 1) de \(questoes.count)")
                .font(.subheadline)

            Text(questoes[indiceQuestao].enunciado)
                .font(.title2)
                .multilineTextAlignment(.center)
                .padding()

            ForEach(questoes[indiceQuestao].alternativas, id: \.self) { alternativa in
                Button {
                    verificarResposta(alternativa)
                } label: {
                    Text(alternativa)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                }
                .disabled(respostaBloqueada)
            }

            if mostrarFeedback {
                Text(mensagemFeedback)
                    .foregroundColor(mensagemFeedback.contains("✅") ? .green : .red)
                    .multilineTextAlignment(.center)
                    .padding()
            }
        }
        .padding()
    }

    func verificarResposta(_ alternativa: String) {
        respostaBloqueada = true
        let correta = questoes[indiceQuestao].respostaCorreta

        if alternativa == correta {
            acertos += 1
            mensagemFeedback = "✅ Resposta correta!"
        } else {
            mensagemFeedback = """
            ❌ Resposta incorreta!
            Resposta correta: \(correta)
            """
        }

        mostrarFeedback = true

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            mostrarFeedback = false
            respostaBloqueada = false
            avancar()
        }
    }

    func avancar() {
        if indiceQuestao < questoes.count - 1 {
            indiceQuestao += 1
        } else {
            mostrarResultadoFinal = true
        }
    }
}
