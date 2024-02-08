//
//  DashboardProtocol.swift
//  DemoAppVale
//
//  Created by Pabel Saldivar on 07/02/24.
//  
//

import Foundation
import UIKit
/// Protocolo que define los métodos y atributos para el view de Dashboard
protocol DashboardViewProtocol {
    // PRESENTER -> VIEW
    func setOptions(data: [UserDataModel])
}
/// Protocolo que define los métodos y atributos para el routing de Dashboard
protocol DashboardRouterProtocol {
    // PRESENTER -> ROUTING
    func routeToNextView(data: [UserDataModel])
    func showError(message: String)
}
/// Protocolo que define los métodos y atributos para el Presenter de Dashboard
protocol DashboardPresenterProtocol {
    // VIEW -> PRESENTER
    func fetchOptions()
    func validate(dataSource: [UserDataModel])
}
/// Protocolo que define los métodos y atributos para el Interactor de Dashboard
protocol DashboardInteractorInputProtocol {
    // PRESENTER -> INTERACTOR
    func fetchOptions()
    func validate(dataSource: [UserDataModel])
}
/// Protocolo que define los métodos y atributos para el Interactor de Dashboard
protocol DashboardInteractorOutputProtocol {
    // INTERACTOR -> PRESENTER
    func fetchOptions(data: [UserDataModel])
    func validate(result: Result<[UserDataModel], Error>)
}

