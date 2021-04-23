import SwiftUI

struct QuantitySelector: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    @State var count = 0
    @State var item: Item
    @State var action:() -> Void
    
    var body: some View {
        
        if #available(iOS 14.0, *) {
            VStack{
                if self.count == 0 { // No items selected
                    
                    Button(action: {
                        cart.add(item: item)
                        action()
                    }){
                        ZStack {
                            
                            Circle()
                                .frame(width: 20, height: 20)
                                .foregroundColor(Color(#colorLiteral(red: 0.6392156863, green: 0.7960784314, blue: 0.5411764706, alpha: 1)))
                            
                            Image("Plus_white").resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 9)
                            
                        }
                    }
                    
                    
                    
                } else {
                    
                    HStack {
                        
                        Button(action: {
                            
                            cart.remove(itemName: item.name)
                            self.count = 0
                            action()
                            
                        }){
                            
                            ZStack {
                                
                                Circle()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(Color(#colorLiteral(red: 0.5411764706, green: 0.4784313725, blue: 0.6235294118, alpha: 1)))
                                
                                Image(systemName: "minus").resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 9)
                                    .foregroundColor(Color(#colorLiteral(red: 1, green: 0.8980392157, blue: 0.6117647059, alpha: 1)))
                                
                            }
                            
                        }
                        
                        
                        
                        Text(String(format: "%02d", self.count))
                            .font(.custom("OpenSans-Regular", size: 12))
                            .foregroundColor(Color(#colorLiteral(red: 1, green: 0.8980392157, blue: 0.6117647059, alpha: 1)))
                        
                        Button(action: {
                            
                            cart.add(item: item)
                            action()
                            
                        }){
                            
                            ZStack {
                                
                                Circle()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(Color(#colorLiteral(red: 0.5411764706, green: 0.4784313725, blue: 0.6235294118, alpha: 1)))
                                
                                Image("Plus_white").resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 9)
                                    .colorMultiply(Color(#colorLiteral(red: 1, green: 0.8980392157, blue: 0.6117647059, alpha: 1)))
                                
                            }
                            
                        }
                        
                        
                        
                    }
                    
                }
            }.onAppear{
                self.count = cart.count(itemName: item.name)
            }.onChange(of: cart.items, perform: { value in
                self.count = cart.count(itemName: item.name)
            })
        } else {
            // Fallback on earlier versions
        }
        
    }
}

struct QuantitySelector_Previews: PreviewProvider {
    @State static var quant = 0
    static var previews: some View {
        QuantitySelector(item: Items.blanket) {
            print("Hello!")
        }
    }
}
