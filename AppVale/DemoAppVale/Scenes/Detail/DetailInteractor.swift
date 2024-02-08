//
//  DetailInteractor.swift
//  DemoAppVale
//
//  Created by Pabel Saldivar on 08/02/24.
//  
//
import Foundation
class DetailInteractor {
    var presenter: DetailInteractorOutputProtocol?
}
extension DetailInteractor: DetailInteractorInputProtocol {
    func fetchEmployees() {
        guard let url = URL(string: "https://6edeayi7ch.execute-api.us-east-1.amazonaws.com/v1/examen/employees/:pabel_saldivar") else { return }
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            print(String(data: data, encoding: .utf8)!)
            do {
                let decodedObject = try JSONDecoder().decode(EmployeesResponseModel.self, from: data)
                guard let employees = decodedObject.data?.employees else { return}
                DispatchQueue.main.async {
                    self.presenter?.setEmployees(data: employees)
                }
            } catch let error {
                print("Aqui no hay manejo de errores...no dio tiempo --- " + error.localizedDescription)
            }
        }
        task.resume()
    }
    func fetchGenders() {
        presenter?.setGenders(data: ["Hombre", "Mujer", "Otro"])
    }
    func fetchColors() {
        presenter?.setColors(data: [.red, .blue, .brown, .black, .cyan, .green])
    }
}
