import SwiftUI

struct MotherView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        
            
            if viewRouter.currentPage == "signIn" {
                SignInPage()
                    .transition(.opacity)
            } else if viewRouter.currentPage == "signUp" {
                SignUpPage()
                    .transition(.opacity)
                    
            } else if viewRouter.currentPage == "home" {
                HomeView()
                    .transition(.opacity)
            } else if viewRouter.currentPage == "map" {
                MapView()
                    .transition(.opacity)
            } else if viewRouter.currentPage == "onboarding" {
                Onboarding()
                    .transition(.opacity)
            } else if viewRouter.currentPage == "orders" {
                OrderWithCards()
                    .transition(.opacity)
            } else if viewRouter.currentPage == "dateTime" {
                DateAndTime()
                    .transition(.opacity)
            } else if viewRouter.currentPage == "settings" {
                Settings()
                    .transition(.opacity)
            }
            
        }
        
    }

struct MotherView_Previews: PreviewProvider {
    static var previews: some View {
        MotherView().environmentObject(ViewRouter())
    }
}

