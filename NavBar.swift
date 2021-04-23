import SwiftUI

struct NavBar: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom), content: {
            Rectangle()
                .frame(width: UIScreen.main.bounds.width, height: 90)
                .foregroundColor(.white)
            HStack(spacing: 30){
                
                Button(action: {
                    
                    self.viewRouter.currentPage = "home"
                    
                }){
                    VStack{
                        Image("Home_black")
                        .resizable()
                        .frame(width: 34, height: 30)
                        .foregroundColor(.black)
                        Text("Home")
                            .font(
                                .custom("OpenSans-Regular", size: 10.0))
                            .foregroundColor(Color(#colorLiteral(red: 0.6117647059, green: 0.6117647059, blue: 0.6117647059, alpha: 1)))
                    }.frame(width: 50, height: 50)
                }
                
                Button(action: {
                    
                    self.viewRouter.currentPage = "map"
                    
                }) {
                    
                    VStack{
                        Image("Map_Black")
                        .resizable()
                        .frame(width: 20, height: 30)
                        .foregroundColor(.black)
                        Text("Map")
                            .font(
                                .custom("OpenSans-Regular", size: 10.0))
                            .foregroundColor(Color(#colorLiteral(red: 0.6117647059, green: 0.6117647059, blue: 0.6117647059, alpha: 1)))
                    }.frame(width: 50, height: 50)
                }
                
                Button(action:{
                    
                    self.viewRouter.currentPage = "orders"
                    
                }){
                    ZStack{
                        ZStack(){
                            Circle()
                                .frame(width: 60, height: 60)
                                .foregroundColor(.white)
                            Circle()
                                .fill(Color(#colorLiteral(red: 0.3490196078, green: 0.3137254902, blue: 0.6509803922, alpha: 1)))
                                .frame(width: 55, height: 55)
                                .frame(width: 50, height: 50)
                            Image("Plus_white")
                                .resizable()
                                .colorMultiply(Color(.white))
                                .frame(width: 25, height: 25)
                        }.padding(.bottom, 105.0)
                    }
                    .frame(width:50, height:50)
                }
                
                Button(action: {
                    
                    self.viewRouter.currentPage = "orders"
                    
                }){
                    VStack{
                        Image("Order_black")
                        .resizable()
                        .frame(width: 30, height: 28.42)
                        .foregroundColor(.black)
                        Text("Orders")
                            .font(
                                .custom("OpenSans-Regular", size: 10.0))
                            .foregroundColor(Color(#colorLiteral(red: 0.6117647059, green: 0.6117647059, blue: 0.6117647059, alpha: 1)))
                    }
                }.frame(width: 50, height: 50)
                
                Button(action: {
                    
                    self.viewRouter.currentPage = "settings"
                    
                }){
                    VStack{
                        Image("Settings_black")
                        .resizable()
                        .frame(width: 26, height: 26)
                        .foregroundColor(.black)
                        Text("Settings")
                            .font(
                                .custom("OpenSans-Regular", size: 10.0))
                            .foregroundColor(Color(#colorLiteral(red: 0.6117647059, green: 0.6117647059, blue: 0.6117647059, alpha: 1)))
                    }.frame(width: 50, height: 50)
                }
            }.padding(.bottom, 13)
        })
    }
}

struct NavBar_Previews: PreviewProvider {
    static var previews: some View {
        NavBar().environmentObject(ViewRouter()).previewLayout(.sizeThatFits)
    }
}
