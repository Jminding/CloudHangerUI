import SwiftUI
struct ButtonView: View {
    
    @State var label: String
    @Binding var fill: Bool
    @State var action:() -> Void
    
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var userData: UserData
    @EnvironmentObject var cart: Cart
    
    var body: some View {
        
        Button(action: action){
          
            ZStack{
                

                if fill{
                    
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(#colorLiteral(red: 0.9490196078, green: 0.4705882353, blue: 0.3607843137, alpha: 1)))
                        .frame(width: 120, height: 40)
                    Text(label)
                        .font(
                            .custom("OpenSans-Semibold", size: 12.0))
                        .foregroundColor(.white)
                    
                } else {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(#colorLiteral(red: 1, green: 0.9529411765, blue: 0.9450980392, alpha: 1)))
                        .frame(width: 120, height: 40)
                    Text(label)
                        .font(
                            .custom("OpenSans-Semibold", size: 12.0))
                        .foregroundColor(Color(#colorLiteral(red: 0.6117647059, green: 0.6117647059, blue: 0.6117647059, alpha: 1)))
                }
                
                
            }
            
        }
        
        
        
    }
}
struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(label: "Test", fill: .constant(true)) {
            
            print("TestBtnPressed!")
            
        }
    }
}
