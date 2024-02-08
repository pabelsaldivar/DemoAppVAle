//
//  DashboardVC.swift
//  DemoAppVale
//
//  Created by Pabel Saldivar on 07/02/24.
//  
//
import Foundation
import UIKit
class DashboardVC: UIViewController {
    @IBOutlet weak var tableView: UITableView! 
    var presenter: DashboardPresenterProtocol?
    var dataSource: [UserDataModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
        presenter?.fetchOptions()
    }
    private func config() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    @IBAction func continueButtonTapped(_ sender: Any) {
        presenter?.validate(dataSource: dataSource)
    }
}
///Protocolo para recibir datos de presenter.
extension DashboardVC: DashboardViewProtocol {
    func setOptions(data: [UserDataModel]) {
        self.dataSource = data
        tableView.reloadData()
    }
}
extension DashboardVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DashboardTableViewCell", for: indexPath) as? DashboardTableViewCell else { return UITableViewCell() }
        cell.indexPath = indexPath
        cell.item = dataSource[indexPath.row]
        cell.delegate = self
        return cell
    }
}
extension DashboardVC: DashboardTableViewCellDelegate {
    func switchChange(to isEnabled: Bool, at indexPath: IndexPath) {
        dataSource[indexPath.row].isEnabled = isEnabled
    }
}
