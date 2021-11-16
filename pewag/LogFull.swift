//A class with password encryption functions (sha256) and a token supplied from the login form. Calling the login API.

import Foundation
import SwiftUI

class LogFull : ObservableObject {
    
    @Published var username : String = ""
    @Published var password : String = ""
    
    func log() {
        
        //Password encryption function.
        let sha256 : String =
        Crypto.shared.pbkdf2sha256(
            password: password,
            salt: "c586a5585e663e53215f008b4bf99e63982d492321225412cfd1bfff351659a2",
            keyByteCount: 20,
            rounds: 5000
        )!
        
        //API path.
        var urlRequest = URLRequest(url: URL(string: "https://api.pewag40.com/api/userLogin?username=\(username)&password=\(sha256)")!)
        
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("Bearer \(String(describing: UserDefaults.standard.string(forKey: "jsonwebtoken")!))",forHTTPHeaderField: "Authorization")
        urlRequest.setValue("application/json",forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            let tmpjson = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [String:Any]
            print(tmpjson!)
        }
        task.resume()
        
    }
    
    
    
}

