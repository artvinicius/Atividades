//
//  main.swift
//  Atividade1
//
//  Created by Oliveira, Arthur Vinicius Gomes Santos Mendes Oliveira on 09/04/26.
//
let gerenciador = GerenciadorDeContatos()
var executando = true

while executando {
    print("""
    ===== MENU =====
    1 - Cadastrar contato
    2 - Listar contatos
    3 - Alterar contato
    4 - Remover contato
    5 - Finalizar
    Escolha uma opção:
    """)

    let opcao = readLine()

    switch opcao {
    case "1":
        gerenciador.cadastrarContato()
    case "2":
        gerenciador.listarContatos()
    case "3":
        gerenciador.alterarContato()
    case "4":
        gerenciador.removerContato()
    case "5":
        executando = false
        print("Sistema finalizado.   by: Arthur Vinicius")
    default:
        print("Opção inválida.")
    }
}
