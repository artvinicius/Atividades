import Foundation

struct Perguntas {

    static let temas = [
        "História",
        "Física",
        "Geografia",
        "Matemática"
    ]

    static let questoesPorTema: [String: [Questao]] = [

        "História": [
            Questao(
                enunciado: "Em que ano ocorreu a Proclamação da República no Brasil?",
                alternativas: ["1889", "1822", "1930", "1964"],
                respostaCorreta: "1889"
            ),
            Questao(
                enunciado: "Quem foi o primeiro presidente do Brasil?",
                alternativas: ["Deodoro da Fonseca", "Getúlio Vargas", "Dom Pedro I", "Prudente de Morais"],
                respostaCorreta: "Deodoro da Fonseca"
            ),
            Questao(
                enunciado: "A Segunda Guerra Mundial terminou em qual ano?",
                alternativas: ["1939", "1942", "1945", "1950"],
                respostaCorreta: "1945"
            ),
            Questao(
                enunciado: "Quem descobriu o Brasil?",
                alternativas: ["Pedro Álvares Cabral", "Cristóvão Colombo", "Vasco da Gama", "Fernão de Magalhães"],
                respostaCorreta: "Pedro Álvares Cabral"
            ),
            Questao(
                enunciado: "Onde surgiu a civilização egípcia?",
                alternativas: ["Rio Nilo", "Rio Tigre", "Rio Eufrates", "Rio Jordão"],
                respostaCorreta: "Rio Nilo"
            )
        ],

        "Física": [
            Questao(
                enunciado: "Qual é a unidade de força?",
                alternativas: ["Newton", "Joule", "Watt", "Pascal"],
                respostaCorreta: "Newton"
            ),
            Questao(
                enunciado: "Quem criou as leis do movimento?",
                alternativas: ["Newton", "Einstein", "Galileu", "Tesla"],
                respostaCorreta: "Newton"
            ),
            Questao(
                enunciado: "Qual é a velocidade da luz?",
                alternativas: ["300.000 km/s", "150.000 km/s", "30.000 km/s", "3.000 km/s"],
                respostaCorreta: "300.000 km/s"
            ),
            Questao(
                enunciado: "Qual grandeza mede a corrente elétrica?",
                alternativas: ["Ampere", "Volt", "Ohm", "Watt"],
                respostaCorreta: "Ampere"
            ),
            Questao(
                enunciado: "Energia do movimento é chamada de:",
                alternativas: ["Cinética", "Potencial", "Térmica", "Elétrica"],
                respostaCorreta: "Cinética"
            )
        ],

        "Geografia": [
            Questao(
                enunciado: "Qual é o maior continente do mundo?",
                alternativas: ["Ásia", "África", "Europa", "América"],
                respostaCorreta: "Ásia"
            ),
            Questao(
                enunciado: "Qual é o rio mais extenso do mundo?",
                alternativas: ["Amazonas", "Nilo", "Mississipi", "Yang-Tsé"],
                respostaCorreta: "Amazonas"
            ),
            Questao(
                enunciado: "Qual país possui a maior população mundial?",
                alternativas: ["China", "Índia", "Estados Unidos", "Rússia"],
                respostaCorreta: "China"
            ),
            Questao(
                enunciado: "Qual é a capital do Brasil?",
                alternativas: ["Brasília", "Rio de Janeiro", "São Paulo", "Salvador"],
                respostaCorreta: "Brasília"
            ),
            Questao(
                enunciado: "Qual bioma predomina no nordeste brasileiro?",
                alternativas: ["Caatinga", "Amazônia", "Cerrado", "Pampa"],
                respostaCorreta: "Caatinga"
            )
        ],

        "Matemática": [
            Questao(
                enunciado: "Quanto é 7 x 8?",
                alternativas: ["56", "48", "54", "64"],
                respostaCorreta: "56"
            ),
            Questao(
                enunciado: "Qual é a raiz quadrada de 81?",
                alternativas: ["9", "8", "7", "6"],
                respostaCorreta: "9"
            ),
            Questao(
                enunciado: "Quanto é 10% de 200?",
                alternativas: ["20", "10", "30", "25"],
                respostaCorreta: "20"
            ),
            Questao(
                enunciado: "Qual é o valor de π (pi) aproximado?",
                alternativas: ["3,14", "2,17", "1,62", "4,13"],
                respostaCorreta: "3,14"
            ),
            Questao(
                enunciado: "Quantos lados tem um hexágono?",
                alternativas: ["6", "5", "7", "8"],
                respostaCorreta: "6"
            )
        ]
    ]
}
