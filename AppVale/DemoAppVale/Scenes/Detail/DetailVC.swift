//
//  DetailVC.swift
//  DemoAppVale
//
//  Created by Pabel Saldivar on 08/02/24.
//  
//
import Foundation
import UIKit
class DetailVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var presenter: DetailPresenterProtocol?
    var dataSource: [UserDataModel] = []
    var employeesDataSource: [EmployeesModel] = []
    var colorDataSource: [UIColor] = []
    var genderDataSource: [String] = []
    var userImage: UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
        presenter?.getDataSource()
    }
    private func config() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}
///Protocolo para recibir datos de presenter.
extension DetailVC: DetailViewProtocol {
    func setEmployees(data: [EmployeesModel]) {
        employeesDataSource = data
        tableView.reloadData()
    }
    func setGenders(data: [String]) {
        genderDataSource = data
        tableView.reloadData()
    }
    func setColors(data: [UIColor]) {
        colorDataSource = data
        tableView.reloadData()
    }
    func setDataSource(data: [UserDataModel]) {
        self.dataSource = data
        tableView.reloadData()
    }
}
extension DetailVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderTableViewCell", for: IndexPath(row: 0, section: section)) as? HeaderTableViewCell
        cell?.item = dataSource[section]
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch dataSource[section].type {
        case .camera, .name, .phone, .birthdate:
            return 1
        case .employees:
            return employeesDataSource.count
        case .gender:
            return genderDataSource.count
        case .favoriteColor:
            return colorDataSource.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch dataSource[indexPath.section].type {
        case .camera:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CameraTableViewCell", for: indexPath) as? CameraTableViewCell else { return UITableViewCell() }
            cell.item = userImage
            cell.delegate = self
            return cell
        case .employees:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "EmployeeTableViewCell", for: indexPath) as? EmployeeTableViewCell else { return UITableViewCell() }
            cell.employee = employeesDataSource[indexPath.row]
            return cell
        case .gender:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "EmployeeTableViewCell", for: indexPath) as? EmployeeTableViewCell else { return UITableViewCell() }
            cell.item = genderDataSource[indexPath.row]
            return cell
        case .name, .phone:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TextFieldTableViewCell", for: indexPath) as? TextFieldTableViewCell else { return UITableViewCell() }
            return cell
        case .birthdate:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "DatePickerTableViewCell", for: indexPath) as? DatePickerTableViewCell else { return UITableViewCell() }
            return cell
        case .favoriteColor:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ColorTableViewCell", for: indexPath) as? ColorTableViewCell else { return UITableViewCell() }
            cell.item = colorDataSource[indexPath.row]
            return cell
        }
    }
}
extension DetailVC: CameraTableViewCellDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func openCamera() {
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        vc.allowsEditing = true
        vc.delegate = self
        present(vc, animated: true)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        let image = info[.editedImage] as? UIImage
        userImage = image
        tableView.reloadData()
    }
}
