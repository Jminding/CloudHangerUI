import SwiftUI

struct OtherOrderGrid: View {
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false){
            VStack {
            
                HStack(){
                
                    Spacer()
                
                    ItemCard(color: Color(#colorLiteral(red: 0.9882352941, green: 0.7884188357, blue: 0.0004788459118, alpha: 1)), item: Items.jacketCoat)
                
                    Spacer()
                
                    ItemCard(color: Color(#colorLiteral(red: 0, green: 0.9882352941, blue: 0.8607519624, alpha: 1)), item: Items.leather)

                    Spacer()
                
                }
                .padding(.bottom, 20)
                .padding(.top, 1)
            
            
                HStack(){
                
                    Spacer()
                
                    ItemCard(color: Color(#colorLiteral(red: 1, green: 0.8237730801, blue: 0.6205014913, alpha: 1)), item: Items.blanket)
                
                    Spacer()
                
                    ItemCard(color: Color(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)), item: Items.comforter)

                    Spacer()
                
                }
                .padding(.bottom, 20)
                .padding(.top, 1)
                HStack(){
                
                    Spacer()
                
                    ItemCard(color: Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)), item: Items.accessories)
                    
                    Spacer()
                    
                    ItemCard(color: Color(#colorLiteral(red: 0.568868852, green: 0.7699276011, blue: 1, alpha: 1)), item: Items.shoes)
                

                    Spacer()
                
                }
                .padding(.bottom, 20)
                .padding(.top, 1)
                
                Spacer().frame(height: 75)
            
            }
        }
        
    }
}

struct OtherOrderGrid_Previews: PreviewProvider {
    
    @State static var jacketCoatQuantity = 0
    @State static var leatherQuantity = 0
    @State static var blanketQuantity = 0
    @State static var accessoriesQuantity = 0
    @State static var comforterQuantity = 0
    @State static var shoesQuantity = 0
    
    static var previews: some View {
        OtherOrderGrid()
    }
    
}
