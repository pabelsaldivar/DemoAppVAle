//
//  DatePickerTableViewCell.swift
//  DemoAppVale
//
//  Created by Pabel Saldivar on 08/02/24.
//

import UIKit

class DatePickerTableViewCell: UITableViewCell {
    @IBOutlet weak var datePicker: UIDatePicker!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
