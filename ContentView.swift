////File: ContentView.swift
////Project: CustomTabBarInSwiftUI
//
////Created at 02.12.19 by BLCKBIRDS
////Visit www.BLCKBIRDS.com for more.
//
//import SwiftUI
//
//struct ContentView: View {
//    
//    @ObservedObject var viewRouter = ViewRouter()
//    
//    
//    var body: some View {
//        GeometryReader { geometry in
//            VStack {
//                Spacer()
//                if $viewRouter.currentView == "home" {
//                    Text("Home")
//                } else if self.$viewRouter.currentView == "settings" {
//                    Text("Settings")
//                }
//                Spacer()
//                ZStack {
//                    if self.showPopUp {
//                       PlusMenu()
//                        .offset(y: -geometry.size.height/6)
//                    }
//                    HStack {
//                        Image(systemName: "house")
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .padding(20)
//                            .frame(width: geometry.size.width/3, height: 75)
//                            .foregroundColor(self.viewRouter.currentView == "home" ? .black : .gray)
//                            .onTapGesture {
//                                self.viewRouter.currentView = "home"
//                            }
//                        ZStack {
//                            Circle()
//                                .fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9411764706, green: 0.5960784314, blue: 0.09803921569, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.3176470588, blue: 0.1843137255, alpha: 1))]), startPoint: .top, endPoint: .bottom))
//                                .frame(width: 75, height: 75)
//                            Image(systemName: "plus.circle.fill")
//                                .resizable()
//                                .aspectRatio(contentMode: .fit)
//                                .frame(width: 75, height: 75)
//                                .foregroundColor(.white)
//                                .rotationEffect(Angle(degrees: self.showPopUp ? 90 : 0))
//                        }
//                            .offset(y: -geometry.size.height/10/2)
//                            .onTapGesture {
//                                withAnimation {
//                                   self.showPopUp.toggle()
//                                }
//                            }
//                        Image(systemName: "gear")
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .padding(20)
//                            .frame(width: geometry.size.width/3, height: 75)
//                            .foregroundColor(self.viewRouter.currentView == "settings" ? .black : .gray)
//                            .onTapGesture {
//                                self.viewRouter.currentView = "settings"
//                            }
//                    }
//                        .frame(width: geometry.size.width, height: geometry.size.height/10)
//                    .background(Color.white.shadow(radius: 2))
//                }
//            }.edgesIgnoringSafeArea(.bottom)
//        }
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
//
//struct PlusMenu: View {
//    var body: some View {
//        HStack(spacing: 50) {
//            ZStack {
//                Circle()
//                    .fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9411764706, green: 0.5960784314, blue: 0.09803921569, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.3176470588, blue: 0.1843137255, alpha: 1))]), startPoint: .top, endPoint: .bottom))
//                    .frame(width: 70, height: 70)
//                Image(systemName: "camera")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .padding(20)
//                    .frame(width: 70, height: 70)
//                    .foregroundColor(.white)
//            }
//            ZStack {
//                Circle()
//                    .fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9411764706, green: 0.5960784314, blue: 0.09803921569, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.3176470588, blue: 0.1843137255, alpha: 1))]), startPoint: .top, endPoint: .bottom))
//                    .frame(width: 70, height: 70)
//                Image(systemName: "photo")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .padding(20)
//                    .frame(width: 70, height: 70)
//                    .foregroundColor(.white)
//            }
//        }
//            .transition(.scale)
//    }
//}
