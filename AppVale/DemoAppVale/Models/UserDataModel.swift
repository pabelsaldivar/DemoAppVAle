//
//  UserDataModel.swift
//  DemoAppVale
//
//  Created by Pabel Saldivar on 07/02/24.
//
import Foundation
class UserDataModel {
    let type: UserDataType
    var isEnabled: Bool
    init(type: UserDataType, isEnabled: Bool = false) {
        self.type = type
        self.isEnabled = isEnabled
    }
}
