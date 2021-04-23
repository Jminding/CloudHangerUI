import SwiftUI

struct ItemCard: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    @State var color: Color
    @State var image: Image
    @State var title: String
    @State var time: String
    @State var price: Double
    @State var item: Item
    
    @State var cardBg = Color(.white)
    @State var textColor = Color(.black)
    @State var timeColor = Color(#colorLiteral(red: 0.6117647059, green: 0.6117647059, blue: 0.6117647059, alpha: 1))
    
    init(color: Color, item: Item) {
        
        self._color = State(initialValue: color)
        self._image = State(initialValue: item.image)
        self._title = State(initialValue: item.name)
        self._time = State(initialValue: item.time)
        self._price = State(initialValue: item.price)
        self._item = State(initialValue: item)
        
        
        
 
    }
    
    var body: some View {
        
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 20) // Background
                .fill(cardBg)
                .frame(width: 180, height: 220)
                .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1026428811)), radius: 8, x: 0, y: 1)
            
            VStack { // Content
                
                Spacer(minLength: 20)
                
                ZStack { // Image
                    
                    RoundedRectangle(cornerRadius: 13) // Color background
                        .fill(color)
                        .opacity(0.1)
                        .frame(width: 85, height: 85)
                    
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 65, alignment: .center)
                
                    
                }
                
                Spacer(minLength: 20)
                    
                VStack { // Product Info
                    
                    HStack { // Title
                        
                        Text(title)
                            .font(.custom("OpenSans-Semibold", size: 15))
                            .foregroundColor(textColor)
                            .padding(.leading, 10)
                            .padding(.bottom, -10)
                        
                        Spacer()
                    }
                    
                    
                    HStack { // Time
                        
                        Image("Clock_white").resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 12)
                            .colorMultiply(timeColor)
                            .padding(.leading, 10)
                        
                        Text(time)
                            .font(.custom("OpenSans-Semibold", size: 12))
                            .padding(.leading, -5)
                            .foregroundColor(timeColor)
                        
                        Spacer()
                            
                    }
                    
                    Spacer()
                    
                    HStack { // Price and add button
                        
                        Text("$\(String(format: "%.2f", price))")
                            .font(.custom("OpenSans-Semibold", size: 20))
                            .padding(.leading, 10)
                            .foregroundColor(textColor)
                        
                        Spacer()
                        
                        QuantitySelector(item: self.item) {
                            if cart.count(itemName: item.name) >= 1 {
                                self.cardBg = Color(#colorLiteral(red: 0.3490196078, green: 0.3137254902, blue: 0.6509803922, alpha: 1))
                                self.textColor = Color(.white)
                                self.timeColor = Color(#colorLiteral(red: 0.8823529412, green: 0.8823529412, blue: 0.8823529412, alpha: 1))
                            } else {
                                self.cardBg = Color(.white)
                                self.textColor = Color(.black)
                                self.timeColor = Color(#colorLiteral(red: 0.6117647059, green: 0.6117647059, blue: 0.6117647059, alpha: 1))
                            }
                        }.padding(.trailing, 10)
                        
                        
                    }
                    
                    Spacer()
                    
                }
                
            }
            
        }.frame(width: 180, height: 220).onAppear {
            if cart.count(itemName: item.name) == 0 {
                
                self.cardBg = Color(.white)
                self.textColor = Color(.black)
                self.timeColor = Color(#colorLiteral(red: 0.6117647059, green: 0.6117647059, blue: 0.6117647059, alpha: 1))
                
            } else {
                
                self.cardBg = Color(#colorLiteral(red: 0.3490196078, green: 0.3137254902, blue: 0.6509803922, alpha: 1))
                self.textColor = Color(.white)
                self.timeColor = Color(#colorLiteral(red: 0.8823529412, green: 0.8823529412, blue: 0.8823529412, alpha: 1))
                
            }
        }
        
    }
}

struct ItemCard_Previews: PreviewProvider {
    
    @State static var quantity = 0
    
    static var previews: some View {
        ItemCard(color: Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)), item: Items.blouse).previewLayout(.sizeThatFits)
    }
}
