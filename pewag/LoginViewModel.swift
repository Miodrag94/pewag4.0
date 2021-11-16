
import Foundation

class LoginViewModel : ObservableObject {
    
    var username : String = "miso"
    var password : String = "Od8l+elcX6B0UNMMgNhfqQ=="
    var device : String = "iOS"
    
    @Published var isAuthenticated : Bool = false
    
    func log(){
        
        let defaults = UserDefaults.standard
        Webservice().login(username: username, password: password, device: device) { result in
            switch result {
            case .success(let token):
                defaults.setValue(token, forKey: "jsonwebtoken")
                DispatchQueue.main.async {
                    print("Bearer " + token)
                    self.isAuthenticated = true
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
    
}
