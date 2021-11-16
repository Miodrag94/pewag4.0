
import SwiftUI

struct SideMenu: View {
    
    @StateObject var global = GlobalString()
    @Binding var showMenu: Bool
    
    @State var company: [Company] = []
    @State var customer: [Customers] = []
    @State var orders: [Orders] = []
    @State var certificates: [Certificates] = []
    @State var assCertificates: [AssCertificates] = []
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            
            VStack(alignment: .leading, spacing: 14){
                
                Image("user")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 65, height: 65)
                    .clipShape(Circle())
                Text("Miodrag Majkic")
                    .font(.title2.bold())
                Text("miodrag94dns@gmail.com")
                    .font(.callout)
                
            }//:VStack
            .padding(.horizontal)
            .padding(.leading)
            .padding(.bottom)
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack {
                    VStack(alignment: .leading, spacing: 30) {
                        //Tab buttons
                        TabButton(title: "Komandna tabla", image: "pwg-chronometer")
                        TabButton(title: "Kompanije", image: "pwg-company")
                        TabButton(title: "Kupci", image: "pwg-customers")
                        TabButton(title: "Narudzbe", image: "pwg-orders")
                        TabButton(title: "Sertifikati", image: "pwg-certificate")
                        TabButton(title: "Dodjeljeni sertifikati", image: "pwg-assign1")
                        TabButton(title: "Korisnici", image: "pwg-users")
                        TabButton(title: "Dokumenti", image: "pwg-documents")
                        TabButton(title: "Odjava", image: "pwg-logout")
                    }//:VStack
                    .padding()
                    .padding(.leading)
                    .padding(.top, 45)
                    
                    Divider()
                    
                    TabButton(title: "Pewag", image: "note")
                        .padding()
                        .padding(.leading)
                    
                    Divider()
                    
                    VStack(alignment: .leading, spacing: 15) {
                        
                        Button("Settings and privacy"){
                            
                        }
                        Button("Help center"){
                            
                        }
                    }//:VStack
                    .padding()
                    .padding(.leading)
                    .padding(.bottom)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.primary)
                    
                    
                }//:VStack
                
            }//:ScrollView
            
            VStack(spacing: 0) {
                Divider()
                
                HStack{
                    
                    Button {
                        
                    } label: {
                        Image("envolope")
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 22, height: 22)
                        
                    }
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Image("note")
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 22, height: 22)
                        
                    }
                }//:HStack
                .padding([.horizontal, .top], 15)
                .foregroundColor(.primary)
            }//:VStack
            
        }//:VStack
        .padding(.top)
        .frame(maxWidth: .infinity, alignment: .leading)
        // Max Width
        .frame(width: getRect().width - 90)
        .frame(maxHeight: .infinity)
        .background(
            Color.primary
                .opacity(0.04)
                .ignoresSafeArea(.container, edges: .vertical)
        )
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    @ViewBuilder
    func TabButton(title: String, image: String) ->some View {
        
        //For navigation...
        //Simple replace button with Navigation Links...
        
        NavigationLink{
            if title == "Kompanije" {
                VStack (spacing: 0){
                    NavigationView {
                        List (company) { item in
                            NavigationLink (destination: CompanyDetailView(companyItem: item)) {
                                HStack {
                                    VStack{
                                        Text(item.name)
                                            .foregroundColor(Color.blue)
                                            .font(.system(size: 14))
                                        
                                        Text(item.city)
                                        Text(item.address)
                                        Text(item.postalCode)
                                        Divider()
                                    }
                                    .frame(maxWidth: .infinity, alignment: .center)
                                    .font(.system(size: 12))
                                    
                                    
                                }
                            }//: NavigationLink
                        }.navigationBarTitle("Kompanije")
                    }//: Navigation View
                }.onAppear(perform: {
                    companyApi().getData { (company) in
                        self.company = company
                    }
                })
            }
            if title == "Kupci" {
                VStack (spacing: 0){
                    NavigationView {
                        List (customer) { item in
                            NavigationLink (destination: CustomersDetailView(customerItem: item)) {
                                HStack {
                                    VStack{
                                        Text(item.name)
                                            .foregroundColor(Color.blue)
                                            .font(.system(size: 14))
                                        
                                        Text(item.city)
                                        Text(item.address)
                                        Text(item.postalCode)
                                        Divider()
                                    }
                                    .frame(maxWidth: .infinity, alignment: .center)
                                    .font(.system(size: 12))
                                    
                                    
                                }
                            }//:NavigationLink
                        }.navigationTitle("Kupci")
                    }//: NavigationView
                }.onAppear(perform: {
                    customersApi().getData { customer in
                        self.customer = customer
                    }
                })
            }
            if title == "Narudzbe" {
                VStack (spacing: 0){
                    NavigationView {
                        List (orders) { item in
                            NavigationLink (destination: OrdersDetailView(orderItem: item)) {
                                HStack {
                                    VStack{
                                        Text(item.orderNumber)
                                            .foregroundColor(Color.blue)
                                            .font(.system(size: 14))
                                        
                                        Text(item.certificateNumber)
                                        Text(item.commissionNumber)
                                        Text(item.customer)
                                        Text(item.company)
                                        Divider()
                                    }
                                    .frame(maxWidth: .infinity, alignment: .center)
                                    .font(.system(size: 12))
                                    
                                    
                                }
                            }//: NavigationLInk
                        }.navigationTitle("Narudzbe")
                    }//: NAvigationView
                }.onAppear(perform: {
                    ordersApi().getData { orders in
                        self.orders = orders
                    }
                })
            }
            if title == "Sertifikati" {
                VStack (spacing: 0){
                    NavigationView {
                        List (certificates) { item in
                            NavigationLink (destination: CertificatesDetailView(certificateItem: item)) {
                                HStack {
                                    VStack{
                                        Text(item.toCustomer)
                                            .foregroundColor(Color.blue)
                                            .font(.system(size: 14))
                                        
                                        Text(item.pewagSecurityCode)
                                        Text(item.customer)
                                        Text(item.certificateNumber)
                                        Text(item.createdBy)
                                        Text(item.status)
                                        Divider()
                                    }
                                    .frame(maxWidth: .infinity, alignment: .center)
                                    .font(.system(size: 12))
                                    
                                    
                                }
                            }//: NavigationLink
                        }.navigationTitle("Sertifikati")
                    }//: NavigationView
                }.onAppear(perform: {
                    certificatesApi().getData { certificates in
                        self.certificates = certificates
                    }
                })
            }
            if title == "Dodjeljeni sertifikati" {
                VStack (spacing: 0){
                    NavigationView {
                        List (assCertificates) { item in
                            NavigationLink (destination: AssCertificatesDetailView(assCertificateItem: item)) {
                                HStack {
                                    VStack{
                                        Text(item.certificateNumber)
                                            .foregroundColor(Color.blue)
                                            .font(.system(size: 14))
                                        
                                        Text(item.pewagSecurityCode)
                                        Text(item.company)
                                        Text(item.status)
                                        Divider()
                                    }
                                    .frame(maxWidth: .infinity, alignment: .center)
                                    .font(.system(size: 12))
                                    
                                    
                                }
                            }//: NavigationLink
                        }.navigationTitle("Dodjeljeni sertifikati")
                    }//: NavigationView
                }.onAppear(perform: {
                    assCertificatesApi().getData { assCertificates in
                        self.assCertificates = assCertificates
                    }
                })
            }
        } label: {
            HStack(spacing: 14) {
                
                Image(image)
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 22, height: 22)
                
                Text(title)
                
            }//:HStack
            .foregroundColor(.primary)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        
    }//: func TavButton
    
}



struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


extension View{
    func getRect() -> CGRect{
        return UIScreen.main.bounds
    }
}
