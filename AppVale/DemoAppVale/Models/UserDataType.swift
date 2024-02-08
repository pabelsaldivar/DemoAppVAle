//
//  UserDataType.swift
//  DemoAppVale
//
//  Created by Pabel Saldivar on 07/02/24.
//
import Foundation
enum UserDataType: CaseIterable {
    case camera
    case employees
    case name
    case phone
    case birthdate
    case gender
    case favoriteColor
}
extension UserDataType {
    var title: String {
        var value = ""
        switch self {
        case .camera:
            value = "Cámara"
        case .employees:
            value = "Lista de empleados"
        case .name:
            value = "Nombre completo"
        case .phone:
            value = "Número telefónico"
        case .birthdate:
            value = "Fecha de nacimiento"
        case .gender:
            value = "Sexo (Masculino / Femenino)"
        case .favoriteColor:
            value = "Color Favorito"
        }
        return value
    }
    var icon: String {
        var value = ""
        switch self {
        case .camera:
            value = "camera.fill"
        case .employees:
            value = "person.3.sequence.fill"
        case .name:
            value = "person.circle.fill"
        case .phone:
            value = "phone.circle.fill"
        case .birthdate:
            value = "birthday.cake.fill"
        case .gender:
            value = "circlebadge.fill"
        case .favoriteColor:
            value = "dot.squareshape.fill"
        }
        return value
    }
}
