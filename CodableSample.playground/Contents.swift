import UIKit
import XCTest

struct Person: Codable {
    enum CodingKeys: String, CodingKey {
        case name
        case age
        case date
        case url
        case beer
    }
    
    struct Beer: Codable {
        enum CodingKeys: String, CodingKey {
            case name
            case percentage
        }
        
        let name: String
        let percentage: Float
    }
    
    let name: String
    let age: Int
    let date: Date
    let url: URL
    let beer: [Beer]
}

let jsonString = "{\"name\":\"Willey\",\"age\":30,\"date\":519751611.12542897,\"url\":\"http://nsdateformatter.com\",\"beer\":[{\"name\":\"BEEEER\", \"percentage\": 0.96}]}"
let jsonData = jsonString.data(using: .utf8)!
let decoder = JSONDecoder()
let person = try! decoder.decode(Person.self, from: jsonData)

let encoder = JSONEncoder()
encoder.outputFormatting = .prettyPrinted
encoder.dateEncodingStrategy = .iso8601
encoder.dataEncodingStrategy = .base64
let data = try! encoder.encode(person)
print(String(data: data, encoding: .utf8)!)
print(person.url.absoluteString)









