//LogInView screen

import SwiftUI
import FBSDKCoreKit
import FBSDKLoginKit

struct LogInView: View {
    
    @StateObject private var loginVM = LogFull()
    @StateObject private var tokenVM = LoginViewModel()
    
    @StateObject var identifier = LocalizableString()
    //@State var identifier: String = "sr"
    
    @State var userData: [UserModel] = []
    
    @AppStorage("loged") var logged = false
    @AppStorage("email") var email = ""
    @State var manager = LoginManager()
    
    
    
    
    var body: some View {
        ZStack {
            Color(red: 0.00, green: 0.22, blue: 0.39)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            ZStack {
                
                RoundedRectangle(cornerRadius: 30)
                    .fill(Color.white)
                VStack {
                    // this is VStack in our app
                    Image("pewag_logo")
                        .padding(.vertical, 30.0)
                    TextField("Username", text: $loginVM.username)
                        .padding()
                        .background(Color(red: 0.74, green: 0.74, blue: 0.74))
                    SecureField("Password", text: $loginVM.password)
                        .padding()
                        .background(Color(red: 0.74, green: 0.74, blue: 0.74))
                        .foregroundColor(Color.red)
                    HStack{
                        Toggle(isOn: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Is On@*/.constant(true)/*@END_MENU_TOKEN@*/) {
                            Text("Remember me!")
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                        }
                        .frame(width: 180)
                        Spacer()
                        Button(action: {
                            
                        }, label: {
                            Text("Forgot pwd?")
                            
                        })
                    }
                    Spacer()
                    Button(action: {
                        
                        tokenVM.log()
                        loginVM.log()
                        
                    }, label: {
                        Text("LOG IN")
                            .fontWeight(.heavy)
                            .foregroundColor(Color.white)
                            .frame(width: 330.0, height: 35.0)
                    })
                        .padding()
                        .background(Color(red: 0.00, green: 0.22, blue: 0.39))
                    Spacer()
                    HStack{
                        NavigationLink( destination: LogOutView(), isActive: $logged) {EmptyView()}
                        Button(action: {
                            
                            if logged {
                                manager.logOut()
                                email = ""
                                logged = false
                            }
                            else{
                                manager.logIn(permissions: ["public_profile","email"], from: nil) { (result, err) in
                                    
                                    if err != nil{
                                        print(err!.localizedDescription)
                                        return
                                    }
                                    logged = true
                                    
                                    let request = GraphRequest(graphPath: "me", parameters: ["fields" : "email"])
                                    
                                    request.start { _,res,_ in
                                        
                                        guard let profileData = res as? [String : Any]
                                        else{return}
                                        
                                        email = profileData["email"] as! String
                                        
                                    }
                                }
                            }
                            
                            
                        }) {
                            Image("facebook-3")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                            
                        }
                        Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                            Image("google-plus")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                        }
                        Button(action:  {
                            
                        }, label: {
                            Image("apple")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                                .background(.black)
                        })
                        
                    }
                    Spacer()
                    HStack{
                        Text("Dont have an account?")
                            .foregroundColor(.black)
                        NavigationLink(
                            destination: LogOutView().navigationBarHidden(true),
                            label: {
                                Text("Sing Up")
                                    .foregroundColor(.red)
                            })                    }
                    
                    
                }
                .padding()
                
            }
            .padding(.vertical, 110.0)
            
            HStack(spacing: 15){
                Button(action: {
                    self.identifier.language = "en"
                }) {
                    Image("eng_flag")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                }
                Button(action: {
                    self.identifier.language = "de"
                }) {
                    Image("ger_flag1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                    
                }
                Button(action: {
                    self.identifier.language = "sr"
                }) {
                    Image("srb-flag")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                    
                }
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            }.padding(.top, 650.0)
        }.environment(\.locale, .init(identifier: identifier.language))
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}



//.navigationBarBackButtonHidden(true)
