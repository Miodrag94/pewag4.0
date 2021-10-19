

import Foundation

enum AuthenticationErrorLog: Error {
    case invalidCredentials
    case custom(errorMessage: String)
}

struct LoginRequestBodyLog: Codable {
    var username: String = "miso"
    var password: String = "7aa5546aaf6326d7ba6dedb6d53db30a9a928fd5"
}

struct LoginResponseLog: Codable {
    let status: Int?
    let message: String?
    let userId: String?
}

class LogInAPI  {
    
    func login(username: String, password: String, completion: @escaping (Result<String, AuthenticationError>) -> Void) {
        
        guard let url = URL(string: "https://api.pewag40.com/api/userLogin") else {
            completion(.failure(.custom(errorMessage: "URL is not correct")))
            return
        }
        let body = LoginRequestBodyLog(username: "miso", password: "7aa5546aaf6326d7ba6dedb6d53db30a9a928fd5")
        
        
        var request = URLRequest(url:url)
        request.httpMethod = "POST"
        //request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(  "Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtaXNvIiwiZXhwIjoxNjMxODE0NDI2LCJpYXQiOjE2MzE3OTY0MjZ9.SofUSUIU_x7ysCkgpRZoxbQifrclIg3jyu3swqwaVED0zusNPuI-3L55GhaTJRPRIYgNdixPDUMgBMdej_LBMA", forHTTPHeaderField: "Authorization")
        request.httpBody = try? JSONEncoder().encode(body)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard let data = data, error == nil else {
                completion(.failure(.custom(errorMessage: "No data")))
                return
            }
            
            guard let loginResponse = try? JSONDecoder().decode(LoginResponseLog.self, from: data ) else {
                completion(.failure(.invalidCredentials))
                return
            }
            
            guard let status = loginResponse.status else {
                completion(.failure(.invalidCredentials))
                return
            }
            
            completion(.success(String(status)))
            
        }.resume()
        
        
    }
}
