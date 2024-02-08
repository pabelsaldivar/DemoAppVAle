//
//  DetailRouter.swift
//  DemoAppVale
//
//  Created by Pabel Saldivar on 08/02/24.
//  
//

import Foundation
import UIKit

class DetailRouter {
    var view: DetailVC
    private var presenter: DetailPresenter
    private var interactor: DetailInteractor
    init(data: [UserDataModel]) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        self.view = viewController
        self.presenter = DetailPresenter()
        self.presenter.dataSource = data
        self.interactor = DetailInteractor()
        view.presenter = self.presenter
        presenter.view = self.view
        presenter.interactor = self.interactor
        presenter.router = self
        interactor.presenter = self.presenter
    }
}
extension DetailRouter: DetailRouterProtocol {
}

