import Foundation

struct TitanicModel: Identifiable {
    static let passClass = ["First Class", "Second Class", "Third Class"]
    static let ports = ["Cherbourg", "Queenstown", "Southampton"]
    static let genders = ["male", "female"]
    
    let id = UUID()
    var passengerClass: String // 1 2 3
    var sex: String // male female
    var age: Int // 22
    var siblingsSpouses: Double // 1 0
    var parentsChildren: Double  // 4 3 2
    var fare: Double
    var port: String
    
    var pClass: Int64 {
        switch passengerClass {
        case "First Class":
            return 1
        case "Second Class":
            return 2
        case "Third Class":
            return 3
        default:
            return 0
        }
    }
}
