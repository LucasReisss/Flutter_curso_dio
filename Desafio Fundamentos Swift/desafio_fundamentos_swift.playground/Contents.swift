import UIKit

let nome: String = "Steve"
var sobrenome: String? = "Jobs"

print("\(nome) \(sobrenome ?? "Wozniak")")

if let sobrenome = sobrenome {
    print("\(nome) \(sobrenome)")
}
