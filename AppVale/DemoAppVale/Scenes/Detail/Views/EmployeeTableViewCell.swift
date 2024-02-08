//
//  EmployeeTableViewCell.swift
//  DemoAppVale
//
//  Created by Pabel Saldivar on 08/02/24.
//
import UIKit
class EmployeeTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    var item: String? {
        didSet {
            configCell()
        }
    }
    var employee: EmployeesModel? {
        didSet {
            setEmployee()
        }
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = ""
    }
    private func configCell() {
        if let item = item {
            nameLabel.text = item
        }
    }
    private func setEmployee() {
        nameLabel.text = ""
        if let employee = employee {
           nameLabel.text = employee.name
       }
    }
}
