

import Foundation
import SwiftUI

enum AuthenticationError : Error {
    case invalidCredentials
    case custom(errorMessage : String)
}

struct LoginRequestBody: Codable {
    var username : String
    var password : String
    var device : String 
}

struct LoginResponse: Codable {
    let token : String?
}

class Webservice : ObservableObject {
    
    
    
    func login(username: String, password: String, device: String, completion: @escaping (Result<String, AuthenticationError>) -> Void) {
        
        guard let url = URL(string: "https://api.pewag40.com/api/authenticate") else {
            completion(.failure(.custom(errorMessage: "URL is not correct")))
            return
        }
        let body = LoginRequestBody(username: username, password: password, device: device)
        
        var request = URLRequest(url:url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(body)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard let data = data, error == nil else {
                completion(.failure(.custom(errorMessage: "No data")))
                return
            }
            
            guard let loginResponse = try? JSONDecoder().decode(LoginResponse.self, from: data ) else {
                completion(.failure(.invalidCredentials))
                return
            }
            
            guard let token = loginResponse.token else {
                completion(.failure(.invalidCredentials))
                return
            }
            completion(.success(token))
            
        }.resume()
    }
}
