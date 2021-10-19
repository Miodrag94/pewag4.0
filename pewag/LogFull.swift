//A class with password encryption functions (sha256) and a token supplied from the login form. Calling the login API.

import Foundation

class LogFull : ObservableObject {
    
    var username : String = ""
    var password : String = ""
    var token : String = "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtaXNvIiwiZXhwIjoxNjM0NjY1MjMxLCJpYXQiOjE2MzQ2NDcyMzF9.iEi_rXQeoq53z2l0w7RYyflaPmgwFoiu4cBu3zC81SdJFc9Es7dkJjWZEjZ--6KDJQwcFyzAZA1C_y3KV2zwxw"

    
    func miso() {

         
         let token = "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtaXNvIiwiZXhwIjoxNjM0NjY1MjMxLCJpYXQiOjE2MzQ2NDcyMzF9.iEi_rXQeoq53z2l0w7RYyflaPmgwFoiu4cBu3zC81SdJFc9Es7dkJjWZEjZ--6KDJQwcFyzAZA1C_y3KV2zwxw"

            var urlRequest = URLRequest(url: URL(string: "https://api.pewag40.com/api/companies")!)

            urlRequest.httpMethod = "POST"
            urlRequest.setValue("Bearer \(token)",forHTTPHeaderField: "Authorization")
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")


            URLSession.shared.dataTask(with: urlRequest) { data, response, error in
                    guard error == nil else {
                        print("Error: error calling POST")
                        print(error!)
                        return
                    }
                    guard let data = data else {
                        print("Error: Did not receive data")
                        return
                    }
                    guard let response = response as? HTTPURLResponse, (200 ..< 299) ~= response.statusCode else {
                        print("Error: HTTP request failed")
                        return
                    }
                    
                    guard let jsonObject = String(data: data, encoding: .utf8) else {
                            print("Error: Cannot convert data to JSON object")
                            return
                    }
                
                    print(jsonObject)
                }.resume()
    }
     

    
    
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
        urlRequest.setValue("Bearer \(token)",forHTTPHeaderField: "Authorization")
        urlRequest.setValue("application/json",forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            let tmpjson = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [String:Any]
            print(tmpjson!)
        }
        task.resume()
        

    }
    
}
