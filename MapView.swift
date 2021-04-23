import MapKit
import SwiftUI
struct drycleaner: Identifiable {
    var id = UUID()
    let name: String
    let latitude: Double
    let longitude: Double
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    var coordinate: CLLocationCoordinate2D {
      CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
  }
struct MapView: View {
    let drycleanersintenafly = [
      drycleaner(name: "Tenafly Dry Cleaners", latitude: 40.927160, longitude: -73.966750),
      drycleaner(name: "Cambridge Cleaners", latitude:  40.924970, longitude: -73.965060),
      drycleaner(name: "Lowell Cleaners", latitude: 40.927100, longitude: -73.966010)
    ]
    @State var coordinateRegion = MKCoordinateRegion(
      center: CLLocationCoordinate2D(latitude: 40.919800, longitude: -73.960580),
      span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03))
    var body: some View {
        if #available(iOS 14.0, *) {
            
            ZStack{
                Map(coordinateRegion: $coordinateRegion,
                    annotationItems: drycleanersintenafly) { place in
                    MapMarker(coordinate: place.coordinate, tint: Color(#colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)))
                }.edgesIgnoringSafeArea(.all)
                VStack{
                    Spacer()
                    NavBar()
                        .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1026428811)), radius: 8, x: 0, y: 1)
                }
            }.edgesIgnoringSafeArea(.all)

        } else {
            // Fallback on earlier versions
        }
    }
  }
struct MapvView_Previews: PreviewProvider {
    static var previews: some View {
        MapView().environmentObject(ViewRouter()).environmentObject(UserData())
    }
}
