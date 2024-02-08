//
//  DetailProtocol.swift
//  DemoAppVale
//
//  Created by Pabel Saldivar on 08/02/24.
//  
//
import Foundation
import UIKit
/// Protocolo que define los métodos y atributos para el view de Detail
protocol DetailViewProtocol {
    // PRESENTER -> VIEW
    func setDataSource(data: [UserDataModel])
    func setEmployees(data: [EmployeesModel])
    func setGenders(data: [String])
    func setColors(data: [UIColor])
}
/// Protocolo que define los métodos y atributos para el routing de Detail
protocol DetailRouterProtocol {
    // PRESENTER -> ROUTING
}
/// Protocolo que define los métodos y atributos para el Presenter de Detail
protocol DetailPresenterProtocol {
    // VIEW -> PRESENTER
    var dataSource: [UserDataModel] { get set }
    func getDataSource()
}
/// Protocolo que define los métodos y atributos para el Interactor de Detail
protocol DetailInteractorInputProtocol {
    // PRESENTER -> INTERACTOR
    func fetchEmployees()
    func fetchGenders()
    func fetchColors()
}
/// Protocolo que define los métodos y atributos para el Interactor de Detail
protocol DetailInteractorOutputProtocol {
    // INTERACTOR -> PRESENTER
    func setEmployees(data: [EmployeesModel])
    func setGenders(data: [String])
    func setColors(data: [UIColor])
}

