//
//  EmployeesResponseModel.swift
//  DemoAppVale
//
//  Created by Pabel Saldivar on 08/02/24.
//

import Foundation
struct EmployeesResponseModel: Codable {
    var data: EmployeesDataResponseModel?
}
struct EmployeesDataResponseModel: Codable {
    var employees: [EmployeesModel]?
}
struct EmployeesModel: Codable {
    var name: String?
}
