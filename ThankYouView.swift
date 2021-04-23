import SwiftUI

struct ThankYouView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    @State var dropoffTime: String
    
    var body: some View {
    
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .fill(Color(.white))
                .frame(width: 350, height: 550)
                
            
            VStack{
                
                Spacer()
                
                Image("smiley").resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 140)
                
                Spacer().frame(height: 30)
                
                Text("Thank you for your order!")
                    .font(.custom("OpenSans-Semibold", size: 25)).padding(.bottom, 20)
                
                Text("You can drop off your order at Tenafly Dry Cleaners on \(dropoffTime).")
                    .font(.custom("OpenSans-Regular", size: 16))
                    .foregroundColor(Color(#colorLiteral(red: 0.6117647059, green: 0.6117647059, blue: 0.6117647059, alpha: 1)))
                    .multilineTextAlignment(.center).padding(.leading, 15).padding(.trailing, 15)
                
                
               Spacer()
                
                Button(action: {
                    
                    viewRouter.currentPage = "home"
                    
                }){
                    
                
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color(#colorLiteral(red: 0.3490196078, green: 0.3137254902, blue: 0.6509803922, alpha: 1)))
                            .frame(width: 300, height: 45)
                        
                        HStack {
                            Text("Go Home")
                                .foregroundColor(.white)
                                .font(.custom("OpenSans-Bold", size: 15))
                            Image("RightArrow_White").resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 16, alignment: .center)
                        }
                    }
                }
                
                Spacer()
                
            }
            
        }.frame(width: 350, height: 550).shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1026428811)), radius: 8, x: 0, y: 1)
        
        
        
        
    }
}

struct ThankYouView_Previews: PreviewProvider {
    static var previews: some View {
        ThankYouView(dropoffTime: "TEST")
    }
}
