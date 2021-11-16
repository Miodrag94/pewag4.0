

import SwiftUI
import CodeScanner

struct Home: View {
    
    
    @State var identifier = LocalizableString()
        //@State var identifier = "sr"
    @Binding var showMenu: Bool
    
    
    
    
    var body: some View {
        
        VStack{
            
            VStack(spacing: 0){
                
                HStack{
                    
                    Button {
                        withAnimation{showMenu.toggle()}
                    } label: {
                        Image("user")
                            .resizable()
                            .aspectRatio( contentMode: .fill)
                            .frame(width: 35, height: 35)
                            .clipShape(Circle())
                    }

                    Spacer()
                    
                    //:Navigation Link
                    NavigationLink {
                        Text("Timeline View")
                            .navigationTitle("Timeline")
                    } label: {
                        Image("note")
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio( contentMode: .fit)
                            .frame(width: 22, height: 22)
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                    
                    
                }//:HSTACK
                .background(Color(red: 0.00, green: 0.22, blue: 0.39))
                Divider()
            }//:VStack
            .overlay(
                Image("pewag_logo_white")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 60)
            )
            
            Spacer()
        }//:VStack
        
        .environment(\.locale, .init(identifier: identifier.language))
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
