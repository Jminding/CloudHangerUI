import SwiftUI

struct PantsOrderGrid: View {
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false){
            
            VStack {
            
                HStack(){
                
                    Spacer()
                
                    ItemCard(color: Color(#colorLiteral(red: 1, green: 0.8237730801, blue: 0.6205014913, alpha: 1)), item: Items.dressPants)
                
                    Spacer()
                
                    ItemCard(color: Color(#colorLiteral(red: 0.568868852, green: 0.7699276011, blue: 1, alpha: 1)), item: Items.woolSuitPants)

                    Spacer()
                
                }
                .padding(.bottom, 20)
                .padding(.top, 1)
                
            
                HStack(){
                    
                    Spacer()
                
                    ItemCard(color: Color(#colorLiteral(red: 0.9882352941, green: 0.7884188357, blue: 0.0004788459118, alpha: 1)), item: Items.skirt)
                
                    Spacer()
                
                    ItemCard(color: Color(#colorLiteral(red: 0, green: 0.9882352941, blue: 0.8607519624, alpha: 1)), item: Items.onePiece)

                    Spacer()
                
                }
                .padding(.bottom, 20)
                .padding(.top, 1)
                
                HStack(){
                
                    Spacer()
                
                    ItemCard(color: Color(#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)), item: Items.shorts)
                
                    Spacer()
                
                    ItemCard(color: Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)), item: Items.jeans)

                    Spacer()
                
                }
                .padding(.bottom, 20)
                .padding(.top, 1)
                
                Spacer().frame(height: 75)
            
            }
        }
        
    }
}

struct PantsOrderGrid_Previews: PreviewProvider {
    
    @State static var skirtQuantity = 0
    @State static var onePieceQuantity = 0
    @State static var dressPantsQuantity = 0
    @State static var woolSuitQuantity = 0
    @State static var shortsQuantity = 0
    @State static var jeansQuantity = 0
    
    static var previews: some View {
        PantsOrderGrid()
    }
    
}
