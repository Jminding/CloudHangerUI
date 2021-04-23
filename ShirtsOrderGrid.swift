import SwiftUI

struct ShirtsOrderGrid: View {

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(){
            
                HStack(){
                
                    Spacer()
                
                    ItemCard(color: Color(#colorLiteral(red: 0.9882352941, green: 0.7884188357, blue: 0.0004788459118, alpha: 1)), item: Items.dressShirt)
                
                    Spacer()
                
                    ItemCard(color: Color(#colorLiteral(red: 0, green: 0.9882352941, blue: 0.8607519624, alpha: 1)), item: Items.blouse)

                    Spacer()
                
                }
                .padding(.bottom, 20)
                .padding(.top, 1)
            
            
                HStack(){
                
                    Spacer()
                
                    ItemCard(color: Color(#colorLiteral(red: 1, green: 0.8237730801, blue: 0.6205014913, alpha: 1)), item: Items.twoPieceSuit)
                
                    Spacer()
                
                    ItemCard(color: Color(#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)), item: Items.sweater)

                    Spacer()
                
                }
                .padding(.bottom, 20)
                .padding(.top, 1)
                HStack(){
                
                    Spacer()
                
                    ItemCard(color: Color(#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)), item: Items.threePieceSuit)
                
                    Spacer()
                
                    ItemCard(color: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)), item: Items.vest)

                    Spacer()
                
                }.padding(.bottom, 20)
                .padding(.top, 1)
                
                Spacer().frame(height: 75)
                
            }
        
        }
    }
}

struct ShirtsOrderGrid_Previews: PreviewProvider {
    
    @State static var dressShirtQuantity = 0
    @State static var blouseQuantity = 0
    @State static var twopcsuitQuantity = 0
    @State static var sweaterQuantity = 0
    @State static var threepcsuitQuantity = 0
    @State static var vestQuantity = 0
    
    static var previews: some View {
        ShirtsOrderGrid()
    }
}
