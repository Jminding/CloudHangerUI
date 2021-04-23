import SwiftUI
import Firebase

struct OrderWithCards: View {
    
    @State var shirtsSelect = true
    @State var pantsSelect = false
    @State var othersSelect = false
    @State var totalCount = 0
    
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var userData: UserData
    @EnvironmentObject var cart: Cart
    
    var body: some View {
        if #available(iOS 14.0, *) {
            ZStack(){
                
                Color(#colorLiteral(red: 0.9921568627, green: 0.9921568627, blue: 0.9921568627, alpha: 1)).edgesIgnoringSafeArea(.all)
                
                VStack(){
                    ZStack(){
                        Rectangle()
                            .frame(width: UIScreen.main.bounds.width, height: 200)
                            .foregroundColor(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                            .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1026428811)), radius: 8, x: 0, y: -1)
                        VStack(){
                            Spacer()
                            ZStack{
                                
                                HStack{
                                    
                                    Button(action: {
                                        self.viewRouter.currentPage = "home"
                                    }){
                                        
                                        Image("RightArrow_White").resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .colorMultiply(.black)
                                            .frame(width: 18, alignment: .center)
                                            .rotationEffect(.degrees(180))
                                            .padding(.leading, 35)
                                        
                                    }
                                    Spacer()
                                }.padding(.top, 10)
                                
                                Text("Select Items")
                                    .font(.custom("OpenSans-SemiBold", size: 37.0))
                                    .padding(.bottom, -7)
                                
                            }.padding(.top, 20)
                            
                            
                            
                            
                            Spacer()
                            HStack(){
                                
                                
                                ButtonView(label: "Tops", fill: $shirtsSelect){
                                    
                                    if !shirtsSelect {
                                        shirtsSelect = true
                                        othersSelect = false
                                        pantsSelect = false
                                    }
                                    
                                }
                                
                                ButtonView(label: "Bottoms", fill: $pantsSelect){
                                    
                                    if !pantsSelect {
                                        shirtsSelect = false
                                        othersSelect = false
                                        pantsSelect = true
                                    }
                                    
                                }
                                
                                ButtonView(label: "Other", fill: $othersSelect) {
                                    
                                    if !othersSelect {
                                        shirtsSelect = false
                                        othersSelect = true
                                        pantsSelect = false
                                    }
                                    
                                }
                                
                            }
                            
                            Spacer()
                            
                        }
                        
                    }.frame(width: UIScreen.main.bounds.width, height: 200)
                    Spacer()
                    
                    ZStack {
                        
                        VStack {
                            
                            if shirtsSelect {
                                
                                ShirtsOrderGrid()
                                
                            } else if pantsSelect {
                                
                                PantsOrderGrid()
                                
                            } else {
                                
                                OtherOrderGrid()
                                
                            }
                            
                            
                        }
                        
                        
                        
                        
                        VStack {
                            Spacer()
                            
                            Button(action: {
                                
                                if self.totalCount != 0 {
                                    
                                    // cart.submit()
                                    
                                    self.viewRouter.currentPage = "dateTime"
                                    
                                }
                                
                            }){
                                
                                if self.totalCount == 0 {
                                    
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 20)
                                            .fill(Color(#colorLiteral(red: 0.8823529412, green: 0.8823529412, blue: 0.8823529412, alpha: 1)))
                                            .frame(width: 350, height: 60)
                                        
                                        HStack {
                                            Text("Continue")
                                                .foregroundColor(Color(#colorLiteral(red: 0.6117647059, green: 0.6117647059, blue: 0.6117647059, alpha: 1)))
                                                .font(.custom("OpenSans-Bold", size: 17))
                                            Image("RightArrow_White").resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 18, alignment: .center)
                                                .colorMultiply(Color(#colorLiteral(red: 0.6117647059, green: 0.6117647059, blue: 0.6117647059, alpha: 1)))
                                        }
                                        
                                    }
                                    
                                } else {
                                    
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 20)
                                            .fill(Color(#colorLiteral(red: 1, green: 0.8980392157, blue: 0.6117647059, alpha: 1)))
                                            .frame(width: 350, height: 60)
                                        
                                        HStack {
                                            Text("Continue")
                                                .foregroundColor(Color(#colorLiteral(red: 0.3490196078, green: 0.3137254902, blue: 0.6509803922, alpha: 1)))
                                                .font(.custom("OpenSans-Bold", size: 17))
                                            Image("RightArrow_White").resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 18, alignment: .center)
                                                .colorMultiply(Color(#colorLiteral(red: 0.3490196078, green: 0.3137254902, blue: 0.6509803922, alpha: 1)))
                                        }
                                    }
                                }
                                
                                
                                
                            }
                        }.padding(.bottom, 20).shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1026428811)), radius: 8, x: 0, y: 1)

                        
                        
                    }
                    
                    
                    
                    
                    
                    Spacer()
                    
                }
            }.edgesIgnoringSafeArea(.all).onAppear{
                self.totalCount = cart.count()
            }.onChange(of: cart.items, perform: { value in
                self.totalCount = cart.count()
            })
        } else {
            // Fallback on earlier versions
        }
    }
}

    
struct OrderWithCards_Previews: PreviewProvider {
    static var previews: some View {
        OrderWithCards().environmentObject(ViewRouter()).environmentObject(UserData()).environmentObject(Cart())
    }
}


