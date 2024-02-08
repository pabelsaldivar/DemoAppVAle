//
//  CameraTableViewCell.swift
//  DemoAppVale
//
//  Created by Pabel Saldivar on 08/02/24.
//

import UIKit
protocol CameraTableViewCellDelegate {
    func openCamera()
}
class CameraTableViewCell: UITableViewCell {
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var imageButton: UIButton!
    var delegate: CameraTableViewCellDelegate?
    var item: UIImage? {
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
            userImageView.image = item
        }
    }
    @IBAction func imageButtonTapped(_ sender: Any) {
        delegate?.openCamera()
    }
}
