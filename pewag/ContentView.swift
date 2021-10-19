
import SwiftUI


struct ContentView: View {
    
    var body: some View {
        NavigationView{
                LogInView()
                    .offset(y: -30)
                LogOutView()
                    .offset(y: -30)
        }
        
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    
}

