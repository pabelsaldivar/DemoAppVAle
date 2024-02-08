//
//  DashboardRouter.swift
//  DemoAppVale
//
//  Created by Pabel Saldivar on 07/02/24.
//  
//

import Foundation
import UIKit

class DashboardRouter {
    private var view: DashboardVC
    private var presenter: DashboardPresenter
    private var interactor: DashboardInteractor
    private var window: UIWindow?
    init(in window: UIWindow?) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "DashboardVC") as! DashboardVC
        self.view = viewController
        self.presenter = DashboardPresenter()
        self.interactor = DashboardInteractor()
        view.presenter = self.presenter
        presenter.view = self.view
        presenter.interactor = self.interactor
        presenter.router = self
        interactor.presenter = self.presenter
        self.window = window
    }
    func showView() {
        window?.rootViewController = UINavigationController(rootViewController: view)
        window?.makeKeyAndVisible()
    }
}
extension DashboardRouter: DashboardRouterProtocol {
    func routeToNextView(data: [UserDataModel]) {
        let router = DetailRouter(data: data)
        self.view.present(router.view, animated: true)
    }
    func showError(message: String) {
        let alertMessagePopUpBox = UIAlertController(title: "Espera un poco", message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default)
        alertMessagePopUpBox.addAction(okButton)
        view.present(alertMessagePopUpBox, animated: true)
    }
}

