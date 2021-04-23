import SwiftUI

struct SummaryView: View {
    
    @EnvironmentObject var cart: Cart
    @EnvironmentObject var userData: UserData
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false){
            
            
            VStack {
                
                ForEach(cart.items, id: \.name) { item in
                    
                    
                    
                    
                    
                    HStack {
                        
                        Spacer()
                        
                        ZStack{
                            
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color(#colorLiteral(red: 1, green: 0.8237730801, blue: 0.6205014913, alpha: 0.1529520255)))
                                .frame(width: 60, height: 60)
                            item.image.resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 40)
                            
                        }
                        
                        VStack(alignment:.leading) {
                            Text(item.name)
                                .font(.custom("OpenSans-Semibold", size: 16))
                        }.frame(width:200, alignment: .leading)
                        
                        
                        
                        Text(String(format: "$%.2f", item.price))
                            .font(.custom("OpenSans-Semibold", size: 16))
                            .foregroundColor(Color(#colorLiteral(red: 0.6117647059, green: 0.6117647059, blue: 0.6117647059, alpha: 1)))
                            
                        
                        Spacer()
                        
                        Button(action: {
                            
                            viewRouter.currentPage = "orders"
                            
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
                        
                        
                        
                        Spacer()
                        
                        

                        
                    }
                
                
                    
                
                
                
                }
                
                
                
                
            }
            
            
        }.frame(maxHeight: 350)
        
        
        
    }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView()
    }
}
