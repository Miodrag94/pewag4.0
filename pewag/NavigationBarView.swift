

import SwiftUI

struct NavigationBarView: View {
    //MARK: PROPERTIES
    //@StateObject private var loginVM = LogFull()
    //MARK: - BODY
    var body: some View {
        
        HStack (spacing: 4){
            
            VStack {
                Image("pewag_logo_white")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 50, alignment: .center)
                    .padding(.horizontal)
//                TextField("Search...", text: $loginVM.username)
//                    .background(Color(red: 0.74, green: 0.74, blue: 0.74))
//                    .clipShape(Capsule())
//                    .frame(width: 120, height: 40)
            }//: HSTACK
            Spacer()
            VStack {
                Image("user")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                .clipShape(Circle())

            }
            Text("Admin Pewag")
                .font(.system(size: 20))
                .foregroundColor(.white)
                .bold()
                .padding()
        } //: HSTACK
        .background(Color(red: 0.00, green: 0.22, blue: 0.39))
    }
}

//MARK: - PREVIEW
struct NavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarView()
            .previewLayout(.sizeThatFits)
            //.padding()
    }
}
