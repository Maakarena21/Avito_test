
import UIKit


//struct CompanyWorkers: Codable {
//    let company: Company
//}
//
//struct Company: Codable {
//    let name: String
//    let workers: [Worker]
//}
//
//struct Worker: Codable {
//    let name: String
//    let numberPhone: String
//    let talents: [String]
//
//    enum CodingKeys: String, CodingKey {
//        case numberPhone = "number_phone"
//        case name
//        case talents
//    }
//}

struct CompanyWorkers: Codable {
    let company: Company
}

// MARK: - Company
struct Company: Codable {
    let name: String
    let employees: [Employee]
}

// MARK: - Employee
struct Employee: Codable {
    let name: String
    let phoneNumber: String
    let skills: [String]
    
    enum CodingKeys: String, CodingKey {
            case name
            case phoneNumber = "phone_number"
            case skills
    }
}
