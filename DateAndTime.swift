import SwiftUI
import PassKit

struct DateAndTime: View {

    @EnvironmentObject var viewRouter: ViewRouter
    
    let paymentHandler = PaymentHandler()
    
    @State var shirtsSelect = false
    @State var pantsSelect = false
    @State var othersSelect = false
    
    @State var showThanks = false
    
    @State var tenaflyCleanersSelected = true
    @State var cambridgeCleanersSelected = false
    @State var lowellCleanersSelected = false
    
    @State var showPicker = false
    @State var currentDate = Date(timeIntervalSinceNow: 0)
    
    @State var dayFormatter = DateFormatter()
    @State var timeFormatter = DateFormatter()
    
    
    var body: some View {
        ZStack(){
            
            
            
            Color(#colorLiteral(red: 0.9921568627, green: 0.9921568627, blue: 0.9921568627, alpha: 1)).edgesIgnoringSafeArea(.all)
            
            DateTimeSelector(completion: {
                
                let dayFormatter = DateFormatter()
                dayFormatter.dateFormat = "MMM. d"
                let timeFormatter = DateFormatter()
                timeFormatter.dateFormat = "h:mm a"
                
            }, show: $showPicker, dateOutput: $currentDate).frame(width: 0, height: 0, alignment: .center)
            
            
            
            
            VStack{
                
                
                ZStack(){
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width, height: 120)
                        .foregroundColor(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                        .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1026428811)), radius: 8, x: 0, y: -1)
                    VStack(){
                        Spacer()
                        ZStack{
                            
                            HStack{
                                
                                Button(action: {
                                    self.viewRouter.currentPage = "orders"
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
                            
                            Text("Submit Order")
                                .font(.custom("OpenSans-SemiBold", size: 37.0))
                                .padding(.bottom, -7)
                            
                        }.padding(.top, 20)
                        
                        
                        
                        
                        Spacer()

                    }
                    
                }.frame(width: UIScreen.main.bounds.width, height: 120)
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                Text("Tenafly Dry Cleaners")
                    .font(.custom("OpenSans-Semibold", size: 22))
                    .foregroundColor(Color(#colorLiteral(red: 0.6117647059, green: 0.6117647059, blue: 0.6117647059, alpha: 1)))
                    .padding(.top, 20)
                
                HStack {
                    
                    if dayFormatter.string(from: currentDate) == ""{
                        Text("Drop off not selected.")
                            .font(.custom("OpenSans-Regular", size: 12))
                            .foregroundColor(Color(#colorLiteral(red: 0.9490196078, green: 0.4705882353, blue: 0.3607843137, alpha: 1)))
                    }else{
                        Text("Drop off \(dayFormatter.string(from: currentDate)) at \(timeFormatter.string(from: currentDate))")
                            .font(.custom("OpenSans-Regular", size: 12))
                            .foregroundColor(Color(#colorLiteral(red: 0.6117647059, green: 0.6117647059, blue: 0.6117647059, alpha: 1)))
                    }
                    
                    
                    Button(action: {
                        
                        showPicker = true
                        
                    }){
                        
                        ZStack{
                            RoundedRectangle(cornerRadius: 9)
                                .strokeBorder(Color(#colorLiteral(red: 0.9490196078, green: 0.4705882353, blue: 0.3607843137, alpha: 1)), lineWidth: 1)
                                .frame(width: 26, height: 26)
                            Image("edit").resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 11)
                                .colorMultiply(Color(#colorLiteral(red: 0.9490196078, green: 0.4705882353, blue: 0.3607843137, alpha: 1)))
                        }
                        
                            
                        
                    }.padding(.top, -3)
                    
                }
                
                Spacer()
                
                SummaryView()
                
                Line().stroke(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)), style: StrokeStyle(lineWidth: 2, dash: [15]))
                    .frame(width: 350, height: 2)
                
                
                HStack{
                    
                    Text("Total")
                        .font(.custom("OpenSans-Semibold", size: 20))
                        .padding(.leading, 22)
                    
                    Spacer()
                    
                    Text(String(format: "$%.2f", cart.totalCost()))
                        .font(.custom("OpenSans-Semibold", size: 20))
                        .padding(.trailing, 22)
                    
                }.padding(.top, 15)
                
                Spacer()
                
                Button(action:{
                    
                    if dayFormatter.string(from: currentDate) != "" {
                        
                        self.paymentHandler.startPayment(taxAmt: 0.0, priceAmt: cart.totalCost()) { (success) in
                            
                            if success {
                                print("Success!")
                                showThanks = true
                            } else {
                                print("Failed")
                            }
                            
                        }
                        
                    }
                    
                    
                    
                }){
                    
                    if dayFormatter.string(from: currentDate) == "" {
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color(#colorLiteral(red: 0.8823529412, green: 0.8823529412, blue: 0.8823529412, alpha: 1)))
                                .frame(width: 350, height: 60)
                            
                            HStack {
                                Text("Submit Order")
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
                                Text("Submit Order")
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
                
                Spacer()
                
                
            }
            
            
            if showThanks {
                
                Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 0.6154565098)).edgesIgnoringSafeArea(.all).transition(.opacity)
                ThankYouView(dropoffTime: "\(dayFormatter.string(from: currentDate)) at \(timeFormatter.string(from: currentDate))").transition(.opacity)
                
            }
            
            
        }.edgesIgnoringSafeArea(.all).onAppear(){
            
            dayFormatter.dateFormat = "MMM. d"
            timeFormatter.dateFormat = "h:mm a"
            
        }
        

    }

}

struct Line: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        return path
    }
}

struct DateAndTime_Previews: PreviewProvider {
    @State static var date = Date()
    static var previews: some View {
        DateAndTime()
    }
}
