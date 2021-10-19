
import SwiftUI

struct LogOutView: View {
    
    @StateObject private var loginVM = LogFull()
    @State var models: [ResponseModel] = []
    
    var body: some View {
        ZStack {
            VStack (spacing: 0){
                NavigationBarView()
                    .padding(.bottom)
                    .padding(.top, 23)
                    .background(Color.white)
                    .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 5)
                Spacer()
                List (self.models) { (model) in
                    HStack {
                        VStack{
                            Text(model.name ?? "")
                                .foregroundColor(Color.blue)
                            Text(model.city ?? "")
                            Text(model.address ?? "")
                            Text(model.postalCode ?? "")
                        }
                    }
                }.navigationTitle("Companies")
            }.onAppear(perform: {
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
                       // Convert model class
                       do{
                           self.models = try JSONDecoder().decode([ResponseModel].self, from: data )
                       }catch{
                           print(error.localizedDescription)
                       }
                       }.resume() //:MARK end of "onAppear"
            })
            
        }//: ZSTACK
        .ignoresSafeArea(.all, edges: .top)
    }

    class ResponseModel: Codable, Identifiable{
        var name : String? = ""
        var city : String? = ""
        var address : String? = ""
        var email : String? = ""
        var phone : String? = ""
        var web : String? = ""
        var postalCode : String? = ""
        var country : String? = ""
        
    }
    
    struct LogOutView_Previews: PreviewProvider {
        static var previews: some View {
            LogOutView()
                
        }
    }
    
}
