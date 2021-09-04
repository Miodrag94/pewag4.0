
import SwiftUI


struct ContentView: View {
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        ZStack {
            Color(red: 0.00, green: 0.22, blue: 0.39)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            ZStack {
                
                RoundedRectangle(cornerRadius: 30)
                    .fill(Color.white)
                VStack {
                    Image("pewag_logo")
                        .padding(.vertical, 30.0)
                    TextField("Username", text: $email)
                        .padding()
                        .background(Color(red: 0.74, green: 0.74, blue: 0.74))
                    SecureField("Password", text: $password)
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
                        Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
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
                    }
                    Spacer()
                    HStack{
                        Text("Dont have an account?")
                            .foregroundColor(.black)
                        Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                            Text("Sing Up")
                                .foregroundColor(Color.red)
                        }
                    }
                    
                    
                }
                .padding()
                
            }
            .padding(.vertical, 110.0)
            
            HStack{
                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                    Image("eng_flag")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                }
                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                    Image("ger_flag1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                        
                }
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            }.padding(.top, 650.0)
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

