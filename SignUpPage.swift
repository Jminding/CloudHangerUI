import SwiftUI

struct SignUpPage: View {
    @State var email: String = ""
    @State var name: String = ""
    @State var password: String = ""
    @State var confirmpassword: String = ""
    @State var showLoginView = false
    @State var showText = false
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    
    
    var body: some View {
        
            ZStack{

                Color(#colorLiteral(red: 0.9921568627, green: 0.9921568627, blue: 0.9921568627, alpha: 1))
                    .edgesIgnoringSafeArea(.all)

                VStack{

                    Spacer()
                    Text("Welcome")
                        .font(
                            .custom("OpenSans-SemiBold", size: 65.0))
                        .padding(.bottom, -15.0)

                    Text("Sign up")
                        .font(
                            .custom("OpenSans-SemiBold", size: 20.0))
                        .padding(.bottom, 60)

                    HStack{ // Email Field
                        Image("Mail_Black").resizable()
                            .frame(width: 23, height: 18)
                            .padding(.leading)
                        TextField("Email", text: $email)
                            .padding()
                            .font(
                                .custom(email == "" ? "OpenSans-Regular" : "OpenSans-Bold", size: 15.0))
                            .frame(width: 275, height: 50)

                    }
                        .background(Color.white)
                        .cornerRadius(27)
                        .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1026428811)), radius: 8, x: 0, y: 1)

                    HStack{ // Name Field
                        Image("Person").resizable()
                            .frame(width: 23, height: 23)
                            .padding(.leading)
                        TextField("Name", text: $name)
                            .padding()
                            .font(
                                .custom(name == "" ? "OpenSans-Regular" : "OpenSans-Bold", size: 15.0))
                            .frame(width: 275, height: 50)

                    }
                        .background(Color.white)
                        .cornerRadius(27)
                        .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1026428811)), radius: 8, x: 0, y: 1)
                        .padding()

                    HStack{ // Psswd Field
                        Image("Lock_Black").resizable()
                            .frame(width: 21, height: 27)
                            .padding(.leading)
                        SecureField("Password", text: $password)
                            .padding()
                            .font(
                                .custom(password == "" ? "OpenSans-Regular" : "OpenSans-Bold", size: 15.0))
                            .frame(width: 275, height: 50)
                    }
                        .background(Color.white)
                        .cornerRadius(27)
                        .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1026428811)), radius: 8, x: 0, y: 1)
                    .padding(.bottom)

                    HStack{ // Psswd Field
                        Image("Lock_Black").resizable()
                            .frame(width: 21, height: 27)
                            .padding(.leading)
                        SecureField("Confirm your password", text: $confirmpassword)
                            .padding()
                            .font(
                                .custom(confirmpassword == "" ? "OpenSans-Regular" : "OpenSans-Bold", size: 15.0))
                            .frame(width: 275, height: 50)
                    }
                        .background(Color.white)
                        .cornerRadius(27)
                        .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1026428811)), radius: 8, x: 0, y: 1)


                    Spacer()

                    HStack{ // Sign in btn

                        Spacer()

                        Text("Create")
                            .font(
                                .custom("OpenSans-Bold", size: 25.0))
                            .padding(.trailing, 5)

                        Button(action: {
                            print("Creating account...") // here there would have been database related code, but I removed it due to this repository going public
                        }){

                            Image("RightArrow_White").resizable()
                                .frame(width: 21.0, height: 15.0)

                        }
                        .frame(width: 70.0, height: 45.0)
                        .background(Color(#colorLiteral(red: 0.3490196078, green: 0.3137254902, blue: 0.6509803922, alpha: 1)))
                        .foregroundColor(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                        .cornerRadius(25)
                        .padding(.trailing, 35)


                    }



                    HStack{

                        Text("Already have an account?")
                            .font(
                                .custom("OpenSans-Regular", size: 15.0))
                            .foregroundColor(Color(#colorLiteral(red: 0.6117647059, green: 0.6117647059, blue: 0.6117647059, alpha: 1)))

                        Button(action: {
                            self.viewRouter.currentPage = "signIn"
                        }){

                            Text("Sign in")
                                .foregroundColor(Color.black)
                                .font(
                                    .custom("OpenSans-Bold", size: 15.0))
                                .underline()

                        }

                    }
                        .padding()

                }

            }

        }   
    }
}
struct SignUpPage_Previews: PreviewProvider {
    static var previews: some View {
        SignUpPage().environmentObject(ViewRouter()).environmentObject(UserData())
    }
}


