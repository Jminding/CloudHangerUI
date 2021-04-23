import SwiftUI

struct Onboarding: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var userData: UserData
    @EnvironmentObject var cart: Cart
    
    var body: some View {
        ZStack(){
            Color(#colorLiteral(red: 0.9921568627, green: 0.9921568627, blue: 0.9921568627, alpha: 1))
            VStack(){
                VStack(){
                    Image("Logo_blue")
                        .resizable()
                        .frame(width: 270, height: 180)
                        .padding(.bottom, -30.0)
                        .padding(.top, -30.0)
                    Text("CloudHanger")
                        .font(.custom("OpenSans-SemiBold",size: 37.0))
                        .padding(.bottom, 15.0)
                    ZStack(){
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.white)
                            .frame(width: 345, height: 510)
                            .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1026428811)), radius: 8, x: 0, y: 1)
                        VStack(){
                            Text("Order and Pay")
                                .font(.custom("OpenSans-SemiBold",size: 37.0))
                            Text("Contactless")
                                .font(.custom("OpenSans-SemiBold",size: 37.0))
                                .padding(.bottom, 20.0)
                            Image("onboardingPhoto")
                                .resizable()
                                .frame(width: 175, height: 175)
                                .foregroundColor(.blue)
                            Text("Instant ordering, order")
                                .font(.custom("OpenSans-SemiBold",size: 21.0)).padding(.top, 30.0)
                            Text("tracking, and contactless")
                                .font(.custom("OpenSans-SemiBold",size: 21.0))
                            
                            Text("payment.")
                                .font(.custom("OpenSans-SemiBold",size: 21.0))
                            
                            Text("Right here.")
                                .font(.custom("OpenSans-SemiBold",size: 33.0))
                                .padding(.top, 20.0)
                        }
                    }.padding(.bottom, 30.0)
                    HStack(){
                        Text("Let's Get Started")
                            .font(
                                .custom("OpenSans-Bold", size: 25.0))
                        Button(action: {
                            self.viewRouter.currentPage = "signIn"
                        }){
                            Image("RightArrow_White").resizable()
                                .frame(width: 21.0, height: 15.0)
                        }
                        .frame(width: 70.0, height: 45.0)
                        .background(Color(#colorLiteral(red: 0.3490196078, green: 0.3137254902, blue: 0.6509803922, alpha: 1)))
                        .foregroundColor(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                        .cornerRadius(25)
                    }
                }
            }
        }
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding().environmentObject(ViewRouter()).environmentObject(UserData())
    }
}
