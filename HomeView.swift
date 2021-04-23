import SwiftUI
struct HomeView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var userData: UserData
    @EnvironmentObject var cart: Cart
    
    var body: some View {
        VStack(){
            Spacer()
            HStack{
                Text("Hello, \(userData.name)")
                    .font(.custom("OpenSans-Semibold",size: 48.0))
                    .padding(.leading)
                Spacer()
            }
            ZStack(){
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 343, height: 495)
                    .foregroundColor(Color(#colorLiteral(red: 0.9921568627, green: 0.9921568627, blue: 0.9921568627, alpha: 1)))
                VStack(){
                    ActualMapView()
                        .frame(width: 343, height: 204)
                        .cornerRadius(20.0)
                    ZStack(){
                        RoundedRectangle(cornerRadius: 20.0)
                            .foregroundColor(Color(#colorLiteral(red: 0.9921568627, green: 0.9921568627, blue: 0.9921568627, alpha: 1)))
                            .frame(width: 343)
                        VStack(){
                            HStack(){
                                Image("tenaflydrycleaners")
                                    .resizable()
                                    .frame(width: 160.0, height: 160.0)
                                    .padding(.all, -10)
                                    .cornerRadius(20.0)
                                VStack(){
                                    Text("Tenafly Dry Cleaners")
                                        .font(.custom("OpenSans-SemiBold", size: 17))
                                        .padding(.bottom, 1.0)
                                    Text("22 Washington St, Tenafly, NJ 07670")
                                        .font(.custom("OpenSans-SemiBold", size: 10.0))
                                        .padding(.bottom, 1.0)
                                    Text("(201) 569-1294")
                                        .font(.custom("OpenSans-SemiBold", size: 10.0))
                                        .padding(.bottom, 1.0)
                                    Text("Open from 7:30 AM - 7:30 PM")
                                        .font(.custom("OpenSans-SemiBold", size: 10.0))
                                        .foregroundColor(Color(#colorLiteral(red: 0.09019607843, green: 0.8705882353, blue: 0.7450980392, alpha: 1)))
                                }
                            }
                            Spacer()
                                .frame(height: 75)
                            Button(action:{
                                self.viewRouter.currentPage = "orders"
                            }){
                                ZStack {
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(Color(#colorLiteral(red: 0.3490196078, green: 0.3137254902, blue: 0.6509803922, alpha: 1)))
                                        .frame(width: 250, height: 50)
                                        
                                    HStack {
                                        Text("Schedule Drop-Off")
                                            .foregroundColor(Color(.white))
                                            .font(.custom("OpenSans-Bold", size: 17))
                
                                    }
                                    
                                }
                            }
                        }
                    }
                }
            }.shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1026428811)), radius: 8, x: 0, y: 1)
            Spacer()
            NavBar()
                .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1026428811)), radius: 8, x: 0, y: 1)
        }.edgesIgnoringSafeArea(.bottom)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(ViewRouter()).environmentObject(UserData()).environmentObject(Cart())
    }
}
