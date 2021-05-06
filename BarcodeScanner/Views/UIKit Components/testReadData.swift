//
//  testReadData.swift
//  BarcodeScanner
//
//  Created by Rathapol Putharaksa on 5/5/2564 BE.
//

import Foundation

struct DemoData: Decodable {
    let code: String
    let status_verbose: String
    struct product : Decodable {
        let _id:String
    }
}


guard let sourcesURL = Bundle.main.url(forResource:"data",withExtension: "json")
else{
    fatalError("Not found")
}
guard let data = try?Data(contentsOf: sourcesURL)
else{
    fatalError("not conver")
    
}
let decoder = JSONDecoder()
guard let product = try?decoder.decode(DemoData.self, from: data)
else{
    fatalError("...")
}
print(product.code)
