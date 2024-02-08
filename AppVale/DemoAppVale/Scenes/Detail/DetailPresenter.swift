//
//  DetailPresenter.swift
//  DemoAppVale
//
//  Created by Pabel Saldivar on 08/02/24.
//  
//
import Foundation
import UIKit
class DetailPresenter {
    var view: DetailViewProtocol?
    var interactor: DetailInteractorInputProtocol?
    var router: DetailRouterProtocol?
    var dataSource: [UserDataModel] = []
}
extension DetailPresenter: DetailPresenterProtocol {
    func getDataSource() {
        view?.setDataSource(data: dataSource)
        for item in dataSource {
            switch item.type {
            case .employees:
                interactor?.fetchEmployees()
            case .gender:
                interactor?.fetchGenders()
            case .favoriteColor:
                interactor?.fetchColors()
            default:
                break
            }
        }
    }
}
extension DetailPresenter: DetailInteractorOutputProtocol {
    func setEmployees(data: [EmployeesModel]) {
        view?.setEmployees(data: data)
    }
    func setGenders(data: [String]) {
        view?.setGenders(data: data)
    }
    func setColors(data: [UIColor]) {
        view?.setColors(data: data)
    }
}
