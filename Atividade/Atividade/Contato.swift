//
//  Contato.swift
//  Atividade1
//
//  Created by Oliveira, Arthur Vinicius Gomes Santos Mendes Oliveira on 09/04/26.
//
class Contato {
    let id: Int
    var nome: String
    var idade: Int
    var telefone: String
    var email: String

    init(id: Int, nome: String, idade: Int, telefone: String, email: String) {
        self.id = id
        self.nome = nome
        self.idade = idade
        self.telefone = telefone
        self.email = email
    }
}
