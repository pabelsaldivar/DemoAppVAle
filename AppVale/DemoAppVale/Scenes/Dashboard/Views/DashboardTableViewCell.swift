//
//  DashboardTableViewCell.swift
//  DemoAppVale
//
//  Created by Pabel Saldivar on 07/02/24.
//
import UIKit
protocol DashboardTableViewCellDelegate {
    func switchChange(to isEnabled: Bool, at indexPath: IndexPath)
}
class DashboardTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var check: UISwitch!
    @IBOutlet weak var iconImageView: UIImageView!
    var delegate: DashboardTableViewCellDelegate?
    var indexPath: IndexPath?
    var item: UserDataModel? {
        didSet {
            configView()
        }
    }
    private func configView() {
        guard let item = item else { return }
        titleLabel.text = item.type.title
        iconImageView.image = UIImage(systemName: item.type.icon)
        check.isOn = item.isEnabled
    }
    @IBAction func switchChange(_ sender: Any) {
        guard let indexPath = indexPath else { return }
        delegate?.switchChange(to: check.isOn, at: indexPath)
    }
}
