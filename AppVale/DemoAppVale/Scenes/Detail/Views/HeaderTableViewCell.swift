//
//  HeaderTableViewCell.swift
//  DemoAppVale
//
//  Created by Pabel Saldivar on 08/02/24.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    var item: UserDataModel? {
        didSet {
            configView()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configView() {
        guard let item = item else { return }
        titleLabel.text = item.type.title
        iconImageView.image = UIImage(systemName: item.type.icon)
    }
}
