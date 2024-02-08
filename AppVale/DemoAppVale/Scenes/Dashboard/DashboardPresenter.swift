//
//  DashboardPresenter.swift
//  DemoAppVale
//
//  Created by Pabel Saldivar on 07/02/24.
//  
//

import Foundation

class DashboardPresenter {
    
    var view: DashboardViewProtocol?
    var interactor: DashboardInteractorInputProtocol?
    var router: DashboardRouterProtocol?
    
}
extension DashboardPresenter: DashboardPresenterProtocol {
    func fetchOptions() {
        interactor?.fetchOptions()
    }
    func validate(dataSource: [UserDataModel]) {
        interactor?.validate(dataSource: dataSource)
    }
}
extension DashboardPresenter: DashboardInteractorOutputProtocol {
    func fetchOptions(data: [UserDataModel]) {
        view?.setOptions(data: data)
    }
    func validate(result: Result<[UserDataModel], Error>) {
        switch result {
        case .success(let data):
            router?.routeToNextView(data: data)
        case .failure(let error):
            router?.showError(message: error.localizedDescription)
        }
    }
}
