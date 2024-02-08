//
//  DashboardInteractor.swift
//  DemoAppVale
//
//  Created by Pabel Saldivar on 07/02/24.
//  
//
import Foundation
class DashboardInteractor {
    var presenter: DashboardInteractorOutputProtocol?
}
extension DashboardInteractor: DashboardInteractorInputProtocol {
    func fetchOptions() {
        let dataType = UserDataType.allCases
        var userData: [UserDataModel] = []
        for item in dataType {
            userData.append(UserDataModel(type: item))
        }
        presenter?.fetchOptions(data: userData)
    }
    func validate(dataSource: [UserDataModel]) {
        let data = dataSource.filter{$0.isEnabled}
        if data.isEmpty {
            let error = NSError(domain: "com.saldivar", code: 0, userInfo: [NSLocalizedDescriptionKey: "Activa al menos un elemento antes de continuar."])
            presenter?.validate(result: .failure(error))
        } else {
            presenter?.validate(result: .success(data))
        }
    }
}
