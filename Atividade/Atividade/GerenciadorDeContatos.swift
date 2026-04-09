//
//  GerenciadorDeContatos.swift
//  Atividade1
//
//  Created by Oliveira, Arthur Vinicius Gomes Santos Mendes Oliveira on 09/04/26.
//
class GerenciadorDeContatos {

    private var contatos: [Contato] = []
    private var proximoID = 1

    //Cadastro
    func cadastrarContato() {
        print("Nome:")
        guard let nome = readLine(), !nome.isEmpty else {
            print("Nome inválido.")
            return
        }

        if contatos.contains(where: { $0.nome.lowercased() == nome.lowercased() }) {
            print("Já existe um contato com esse nome.")
            return
        }

        print("Idade:")
        guard let idadeTexto = readLine(),
              let idade = Int(idadeTexto),
              idade > 0 else {
            print("Idade inválida. Deve ser maior que zero.")
            return
        }

        print("Telefone:")
        guard let telefone = readLine(), !telefone.isEmpty else {
            print("Telefone inválido.")
            return
        }

        print("Email:")
        guard let email = readLine(), !email.isEmpty else {
            print("Email inválido.")
            return
        }

        let contato = Contato(
            id: proximoID,
            nome: nome,
            idade: idade,
            telefone: telefone,
            email: email
        )

        contatos.append(contato)
        proximoID += 1
        print("Contato cadastrado com sucesso!")
    }

    //Listagem
    func listarContatos() {
        if contatos.isEmpty {
            print("Nenhum contato cadastrado.")
            return
        }

        for contato in contatos {
            print("""
            ID: \(contato.id)
            Nome: \(contato.nome)
            Idade: \(contato.idade)
            Telefone: \(contato.telefone)
            Email: \(contato.email)
            ---------------------
            """)
        }
    }

    //Alteração
    func alterarContato() {
        listarResumo()

        print("Informe o ID do contato:")
        guard let texto = readLine(),
              let id = Int(texto),
              let contato = contatos.first(where: { $0.id == id }) else {
            print("ID inválido.")
            return
        }

        print("Novo nome:")
        guard let nome = readLine(), !nome.isEmpty else { return }

        if contatos.contains(where: { $0.nome.lowercased() == nome.lowercased() && $0.id != id }) {
            print("Nome já cadastrado.")
            return
        }

        print("Nova idade:")
        guard let idadeTexto = readLine(),
              let idade = Int(idadeTexto) else { return }

        print("Novo telefone:")
        guard let telefone = readLine(), !telefone.isEmpty else { return }

        print("Novo email:")
        guard let email = readLine(), !email.isEmpty else { return }

        contato.nome = nome
        contato.idade = idade
        contato.telefone = telefone
        contato.email = email

        print("Contato alterado com sucesso!")
    }

    //Remoção
    func removerContato() {
        listarResumo()

        print("Informe o ID para remover:")
        guard let texto = readLine(),
              let id = Int(texto),
              let index = contatos.firstIndex(where: { $0.id == id }) else {
            print("ID inválido.")
            return
        }

        let contato = contatos[index]
        print("Tem certeza que deseja remover o contato \(contato.nome)? (S/N)")

        guard let confirmacao = readLine()?.lowercased(),
              confirmacao == "s" else {
            print("Remoção cancelada.")
            return
        }

        contatos.remove(at: index)
        print("Contato removido com sucesso.")
    }


    //Lista Resumida
    private func listarResumo() {
        if contatos.isEmpty {
            print("Nenhum contato disponível.")
            return
        }

        for contato in contatos {
            print("ID: \(contato.id) - Nome: \(contato.nome)")
        }
    }
}
