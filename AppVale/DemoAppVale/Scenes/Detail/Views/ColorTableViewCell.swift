//
//  ColorTableViewCell.swift
//  DemoAppVale
//
//  Created by Pabel Saldivar on 08/02/24.
//
import UIKit
class ColorTableViewCell: UITableViewCell {
    @IBOutlet weak var colorView: UIView!
    var item: UIColor? {
        didSet {
            configCell()
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
    private func configCell() {
        if let item = item {
            colorView.backgroundColor = item
        }
    }
}
