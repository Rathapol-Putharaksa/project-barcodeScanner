

import Foundation

class ConnectJSON: ObservableObject {
    static var productName:String = ""
    static var nutritionGrade:String = ""
    @Published var item = [Product]()
    
    func loadData(scannedCode:String)-> String {
            let url = URL(string: "https://world.openfoodfacts.org/api/v0/product/"+scannedCode+".json")!
            URLSession.shared.dataTask(with: url) {(data, response, error) in
                do {
                    
                                if let data = data {
                                    print(data.base64EncodedData())
                                    print("sdasdasd")
                                    let decoder = JSONDecoder()
                                        decoder.dateDecodingStrategy = .iso8601
                                    let decodeData = try decoder.decode(Welcome.self, from: data)
                                    DispatchQueue.main.async {
                                        print(decodeData)
                                        self.item = [decodeData.product]
                                        ConnectJSON.productName = decodeData.product.productName
                                        ConnectJSON.nutritionGrade = decodeData.product.nutriscoreGrade
                                        
                                    }
                                    
                                } else {
                                    print("No data")
                                }
                            }
                catch DecodingError.valueNotFound(let type, let context) {
                    Swift.print("could not find type \(type) in JSON: \(context.debugDescription)")
                } catch DecodingError.typeMismatch(let type, let context) {
                    Swift.print("type mismatch for type \(type) in JSON: \(context.debugDescription)")
                } catch DecodingError.dataCorrupted(let context) {
                    Swift.print("data found to be corrupted in JSON: \(context.debugDescription)")
                } catch let error as NSError {
                    NSLog("Error in read(from:ofType:) domain= \(error.domain), description= \(error.localizedDescription)")
                }
               
                        }.resume()
        return ""
                    }
    
    
    
                }
    
        
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try Welcome(json)

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try Welcome(json)

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let code: String
    let product: Product
    let status: Int
    let statusVerbose: String

    enum CodingKeys: String, CodingKey {
        case code, product, status
        case statusVerbose = "status_verbose"
    }
}

// MARK: Welcome convenience initializers and mutators

extension Welcome {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Welcome.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        code: String? = nil,
        product: Product? = nil,
        status: Int? = nil,
        statusVerbose: String? = nil
    ) -> Welcome {
        return Welcome(
            code: code ?? self.code,
            product: product ?? self.product,
            status: status ?? self.status,
            statusVerbose: statusVerbose ?? self.statusVerbose
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Product
struct Product: Codable {
    let nutriscoreGrade, productName: String

    enum CodingKeys: String, CodingKey {
        case nutriscoreGrade = "nutriscore_grade"
        case productName = "product_name"
    }
}

// MARK: Product convenience initializers and mutators

extension Product {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Product.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        nutriscoreGrade: String? = nil,
        productName: String? = nil
    ) -> Product {
        return Product(
            nutriscoreGrade: nutriscoreGrade ?? self.nutriscoreGrade,
            productName: productName ?? self.productName
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}
